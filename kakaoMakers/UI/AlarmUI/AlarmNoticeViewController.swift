//
//  AlarmNoticeViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/30.
//

import UIKit

class AlarmNoticeViewController: UIViewController {

    @IBOutlet weak var alarmNoticeTableView: UITableView!

    var networkPrivider = MovieNetworkManager()
    private var movieListVM: MoviePopular!
    var expandedIndexSet : IndexSet = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmNoticeTableView.rowHeight = UITableView.automaticDimension
      
        alarmNoticeTableView.delegate = self
        alarmNoticeTableView.dataSource = self
        
        getMovieData()
        
    }
    
    func getMovieData() {
        networkPrivider.getMovies(target: .popular) { results in
            self.movieListVM = MoviePopular(popular: results)
            
            OperationQueue.main.addOperation {
                self.alarmNoticeTableView.reloadData()
            }
        }
    }
    
}

extension AlarmNoticeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieListVM == nil ? 0 : movieListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListVM.numberOfRowInSections(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = alarmNoticeTableView.dequeueReusableCell(withIdentifier: "noticeCell", for: indexPath) as! AlarmNoticeTableViewCell
        let movieVM = self.movieListVM.movieAtIndex(indexPath.section, index: indexPath.row)
        cell.titleLabel.text = movieVM.overview
        cell.infoLabel.text = movieVM.release_data
        
        if expandedIndexSet.contains(indexPath.row) {
            cell.titleLabel.numberOfLines = 0
            cell.moreBtn.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        } else {
            cell.titleLabel.numberOfLines = 1
            cell.moreBtn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(expandedIndexSet.contains(indexPath.row)){
            expandedIndexSet.remove(indexPath.row)
        } else {
            expandedIndexSet.insert(indexPath.row)
        }

        self.alarmNoticeTableView.reloadRows(at: [indexPath], with: .automatic)
       }
    
    
}
