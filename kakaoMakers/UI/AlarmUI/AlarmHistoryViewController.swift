//
//  AlarmHistoryViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/30.
//

import UIKit

//class ExpandingTableViewCellContent {
//
//    var expanded: Bool
//
//    init() {
//        self.expanded = false
//    }
//}

class AlarmHistoryViewController: UIViewController {

    @IBOutlet weak var alarmHistoryTableView: UITableView!
    
    var networkProvider = MovieNetworkManager()
    private var movieListVM: MovieNowPlaying!
    var expandedIndexSet : IndexSet = []
    //var answerFilterDatasource =  ExpandingTableViewCellContent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmHistoryTableView.rowHeight = UITableView.automaticDimension
        alarmHistoryTableView.estimatedRowHeight = 150

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
        print("+++++++++++", section)
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
        } else {
            cell.infoLabel.numberOfLines = 1
        }
//        let imagePath = "https://image.tmdb.org/t/p/w500\(movieVM.poster_path!)"
//        cell.settingData(isClicked: answerFilterDatasource, title: movieVM.title!, overview: movieVM.overview!, release_data: movieVM.release_data!,imagePath: imagePath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//           let content = answerFilterDatasource
//           content.expanded = !content.expanded
//           self.alarmHistoryTableView.reloadRows(at: [indexPath], with: .automatic)
        
        if(expandedIndexSet.contains(indexPath.row)){
            expandedIndexSet.remove(indexPath.row)
        } else {
            expandedIndexSet.insert(indexPath.row)
        }

        self.alarmHistoryTableView.reloadRows(at: [indexPath], with: .automatic)
       }
    
  
    
    
}
