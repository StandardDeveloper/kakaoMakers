//
//  CommingSoonViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/15.
//

import UIKit
import Moya
import Kingfisher

class CommingSoonViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieNetworkProvider = MovieNetworkManager()
    var nowPlaying: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight  = 850
        tableView.separatorStyle = .none
        
        getMovieData()
    }
    
    func getMovieData() {
        
        movieNetworkProvider.getMovies(target: .nowPlaying) { results in
            
            self.nowPlaying = results
            
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        }
        
    }
    
}

extension CommingSoonViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nowPlaying.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commingSoonCell", for: indexPath) as! CommingSoonTableViewCell

        let imagePath = "https://image.tmdb.org/t/p/w500\(nowPlaying[indexPath.row].poster_path)"
        cell.posterImageView.kf.setImage(with: URL(string: imagePath))
        cell.titleLabel.text = nowPlaying[indexPath.row].title
        cell.contentsLabel.text = nowPlaying[indexPath.row].overview
        cell.textColorChange(firstText: String(nowPlaying[indexPath.row].id), secondText: "명이 기다려요")
        cell.likeLabel.text = "\(String(nowPlaying[indexPath.row].id))명이 기다려요"
        cell.backgroundColor = UIColor(red: 244/255, green: 243/255, blue: 244/255, alpha: 1)
        return cell
    }
    
}




