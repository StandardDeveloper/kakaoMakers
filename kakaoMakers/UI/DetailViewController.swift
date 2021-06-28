//
//  DetailViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!
    var movieId: Int = 0
    var networkProvider = MovieNetworkManager()
    private var detailMovieListVM: DetailMovieInfo!
    
    var detailMove: DetailMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        detailTableView.rowHeight = UITableView.automaticDimension
        detailTableView.estimatedRowHeight = 500
        
        print("++++++++++++++", movieId)
        getDetailData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailImage" {
            if let vc = segue.destination as? PagingImageViewController {
                
                vc.movieIndex = movieId
                print("-----------", vc.movieIndex)
            }
        }
    }
    
    func getDetailData() {
        
        networkProvider.getDetailMovie(movieID: movieId) { result in
            
            self.detailMove = result
            
            print("///////", result)
           // self.detailMovieListVM = DetailMovieInfo(detailMovieInfo: results)
            
            OperationQueue.main.addOperation {
                self.detailTableView.reloadData()
            }
        }
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1//self.detailMovieListVM == nil ? 0 : self.detailMovieListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//self.detailMovieLx`istVM.numberOfRowInSections(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailTableViewCell
    
        if indexPath.section == 0 {
            cell.titleLabel.text = detailMove?.title
            cell.priceLabel.text = detailMove?.release_date
            
            if (detailMove?.runtime) != nil {
                cell.infoLabel.text = "\(detailMove!.runtime)"
            }
            return cell
        }
        
        return cell
    }
    
    
    
    
}
