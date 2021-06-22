//
//  MainHomeAllViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/19.
//

import UIKit

class MainHomeAllViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!

    var movieNetworkProvider = MovieNetworkManager()
    private var movieListVM: MovieListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "MainNewTableViewCell", bundle: nil)
        mainTableView.register(nibName, forCellReuseIdentifier: "mainTableViewCell")
        
        mainTableView.rowHeight = UITableView.automaticDimension
        mainTableView.estimatedRowHeight = 500

        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        getMovieData()
    }
    
    func getMovieData() {
        
        movieNetworkProvider.getMovies(target: .nowPlaying) { results in
            
            
            self.movieListVM = MovieListViewModel(nowplaying: results)
            
            OperationQueue.main.addOperation {
                self.mainTableView.reloadData()
            }
        }
        
    }
    
}

extension MainHomeAllViewController: UITableViewDelegate, UITableViewDataSource {
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.movieListVM == nil ? 0 : self.movieListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieListVM.numberOfRowInSections(section)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell", for: indexPath) as! MainHomeTableViewCell
        
        let movieVM = self.movieListVM.movieAtIndex(indexPath.section, index: indexPath.row)
        cell.titleLabel.text = movieVM.title
        cell.infoLabel.text = movieVM.overview
        cell.oderLabel.text = "\(movieVM.id!)명이 주문했어요"
        let imagePath = "https://image.tmdb.org/t/p/w500\(movieVM.poster_path!)"
        cell.posterImageView.kf.setImage(with: URL(string: imagePath))
        
        return cell
    }
}
