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
    var detailMove: DetailMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        detailTableView.rowHeight = UITableView.automaticDimension
        detailTableView.estimatedRowHeight = 500
        
        print("++++++++++++++", movieId)
        getDetailData()
        navigationSetup()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailImage" {
            if let vc = segue.destination as? PagingImageViewController {
                
                vc.movieIndex = movieId
                print("-----------", vc.movieIndex)
            }
        }
    }
    
    lazy var backButton: UIBarButtonItem = {
        let buttonIcon = UIImage(systemName: "chevron.backward")
        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(backBtn(_:)))
        button.image = buttonIcon
        button.tintColor = .black
        return button
    }()
    
    @objc func backBtn(_ sender:UIBarButtonItem!){
        navigationController?.popViewController(animated: true)
      }
    
    func navigationSetup() {
        
        navigationItem.title = "제품 정보"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = self.backButton
    }
    
    func getDetailData() {
        
        networkProvider.getDetailMovie(movieID: movieId) { result in
            
            self.detailMove = result
        
            OperationQueue.main.addOperation {
                self.detailTableView.reloadData()
            }
        }
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailTableViewCell
            cell.titleLabel.text = detailMove?.title
            cell.priceLabel.text = detailMove?.release_date
            
            if (detailMove?.runtime) != nil {
                cell.infoLabel.text = "\(detailMove!.runtime)"
            }
            return cell
        }
        
        else if indexPath.section == 1 {
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailInfo", for: indexPath) as! DetailInfoTableViewCell
            if detailMove?.vote_average != nil {
                cell.titleLabel.text = String(detailMove!.id)
            }
            if detailMove?.vote_average != nil {
                cell.infoLabel.text = String(detailMove!.vote_average)
            }
            cell.detailInfoLabel.text = detailMove?.homepage
            return cell
        }
        
        else {
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailOverview", for: indexPath) as! DetailOverviewTableViewCell
            cell.titleLabel.text = "Overview"
            cell.overviewLabel.text = detailMove?.overview
            return cell
        }
    }
}
