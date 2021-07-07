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
    private var movieListVM: MovieNowPlaying!
    
    lazy var likes: [Int:Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "MainNewTableViewCell", bundle: nil)
        mainTableView.register(nibName, forCellReuseIdentifier: "mainTableViewCell")
        
        mainTableView.rowHeight = UITableView.automaticDimension
        //mainTableView.estimatedRowHeight = 500
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        getMovieData()
    }
    
    func getMovieData() {
        
        movieNetworkProvider.getMovies(target: .nowPlaying) { results in
            
            self.movieListVM = MovieNowPlaying(nowPlaying: results)
            
            OperationQueue.main.addOperation {
                self.mainTableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            if let vc = segue.destination as? DetailViewController {
                
                let indexPath = self.mainTableView.indexPathForSelectedRow
                vc.movieId = movieListVM.movieAtIndex(indexPath!.section, index: indexPath!.row).id!//nowPlaying[indexPath!.row].id
                
                print("++++++++++++++++", vc.movieId)
            }
        }
        
    }
    
}

extension MainHomeAllViewController: UITableViewDelegate, UITableViewDataSource, MainHomeTableViewCellDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.movieListVM == nil ? 0 : self.movieListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieListVM.numberOfRowInSections(section)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell", for: indexPath) as! MainHomeTableViewCell
        cell.delegate = self
        cell.index = indexPath.row
        
        let movieVM = self.movieListVM.movieAtIndex(indexPath.section, index: indexPath.row)
        cell.titleLabel.text = movieVM.title
        cell.infoLabel.text = movieVM.overview
        cell.oderLabel.text = "\(movieVM.id!)명이 주문했어요"
        let imagePath = "https://image.tmdb.org/t/p/w500\(movieVM.poster_path!)"
        cell.posterImageView.kf.setImage(with: URL(string: imagePath))
        cell.likeBtn.setTitle("좋아요", for: .normal)
        
        if likes[indexPath.row] == 1 {
            cell.isTouched = true
        }else{
            cell.isTouched = false
        }
        return cell
    }
    
    func didPreasHeart(for index: Int, like: Bool) {
       
        if like == true {
            likes[index] = 1
        }
        else {
            likes[index] = 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
}
