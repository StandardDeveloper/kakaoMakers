//
//  MainHomeNewViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/19.
//

import UIKit

class MainHomeNewViewController: UIViewController {
    
    @IBOutlet weak var newTableView: UITableView!
    
    var movieNetworkProvider = MovieNetworkManager()
    private var movieListVM: MovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newTableView.rowHeight = UITableView.automaticDimension
        newTableView.estimatedRowHeight = 500


        newTableView.delegate = self
        newTableView.dataSource = self
        
        getMovieData()
    }
    
    func getMovieData() {
        
        movieNetworkProvider.getMovies(target: .nowPlaying) { results in
            
            
            self.movieListVM = MovieListViewModel(nowplaying: results)
            
            OperationQueue.main.addOperation {
                self.newTableView.reloadData()
            }
        }
        
    }
    
}

extension MainHomeNewViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.movieListVM == nil ? 0 : self.movieListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieListVM.numberOfRowInSections(section)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainAllTableViewCell
       return cell
       
    }
    
    
}
