//
//  AlarmHistoryViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/30.
//

import UIKit

class AlarmHistoryViewController: UIViewController {

    @IBOutlet weak var alarmHistoryTableView: UITableView!
    
    var networkProvider = MovieNetworkManager()
    private var movieListVM: MovieNowPlaying!
    var expandedIndexSet : IndexSet = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmHistoryTableView.rowHeight = UITableView.automaticDimension

        alarmHistoryTableView.delegate = self
        alarmHistoryTableView.dataSource = self
        
        getMovieData()
    }
    
    func getMovieData() {
        networkProvider.getMovies(target: .nowPlaying) { results in
            self.movieListVM = MovieNowPlaying(nowPlaying: results)
            OperationQueue.main.addOperation {
                self.alarmHistoryTableView.reloadData()
            }
        }
    }
    
}

extension AlarmHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieListVM == nil ? 0 : movieListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListVM.numberOfRowInSections(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = alarmHistoryTableView.dequeueReusableCell(withIdentifier: "alarmHistoryCell", for: indexPath) as! AlarmHistoryTableViewCell
        let movieVM = self.movieListVM.movieAtIndex(indexPath.section, index: indexPath.row)
        
        cell.titleLabel.text = movieVM.title
        cell.infoLabel.text = movieVM.overview
        cell.dateLabel.text = movieVM.release_data
        let imagePath = "https://image.tmdb.org/t/p/w500\(movieVM.poster_path!)"
        cell.historyImageView.kf.setImage(with: URL(string: imagePath))
        
        if expandedIndexSet.contains(indexPath.row) {
            cell.infoLabel.numberOfLines = 0
            cell.moreBtn.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        } else {
            cell.infoLabel.numberOfLines = 1
            cell.moreBtn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(expandedIndexSet.contains(indexPath.row)){
            expandedIndexSet.remove(indexPath.row)
        } else {
            expandedIndexSet.insert(indexPath.row)
        }

        self.alarmHistoryTableView.reloadRows(at: [indexPath], with: .automatic)
       }
}
