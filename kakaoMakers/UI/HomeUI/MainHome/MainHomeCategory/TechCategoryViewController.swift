//
//  TechCategoryViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/22.
//

import UIKit

class TechCategoryViewController: UIViewController {

    @IBOutlet weak var techCollectionView: UICollectionView!
    
    var movieNetworkProvider = MovieNetworkManager()
    private var movieListVM: MovieTopRated!
    
    let lineSpacing: CGFloat = 5
    let inset: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        techCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        techCollectionView.dataSource = self
        techCollectionView.delegate = self
        
        let nibName = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        techCollectionView.register(nibName, forCellWithReuseIdentifier: "categoryCollectionViewCell")
        
        getMovieData()
    }
    
    func getMovieData() {
        
        movieNetworkProvider.getMovies(target: .toRated) { results in
            
            self.movieListVM = MovieTopRated(topRated: results)
            
            OperationQueue.main.addOperation {
                self.techCollectionView.reloadData()
            }
        }
    }
}

extension TechCategoryViewController: UICollectionViewDelegate {
    
    
}

extension TechCategoryViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.movieListVM == nil ? 0 : self.movieListVM.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieListVM.numberOfRowInSections(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = techCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        let movieVM = self.movieListVM.movieAtIndex(indexPath.section, index: indexPath.row)
        let imagePath = "https://image.tmdb.org/t/p/w500\(movieVM.poster_path!)"
        cell.posterImageView.kf.setImage(with: URL(string: imagePath))
        cell.titleLabel.text = movieVM.title
        cell.priceLabel.text = movieVM.release_data
        return cell
    }
}

extension TechCategoryViewController: UICollectionViewDelegateFlowLayout {
    
    //상하간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return inset
    }
    //좌우간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        ///  2등분하여 배치, 옆 간격이 1이므로 1을 빼줌
        let width = collectionView.safeAreaLayoutGuide.layoutFrame.width / 2 - inset - lineSpacing - 10
        let size = CGSize(width: width, height: 280)
        return size
    }
}
