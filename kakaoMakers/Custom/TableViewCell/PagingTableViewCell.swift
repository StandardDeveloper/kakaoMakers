//
//  PagingTableViewCell.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/02.
//

import UIKit

class PagingTableViewCell: UITableViewCell {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pagingCollectionView: UICollectionView!
    
    var networkProvider = MovieNetworkManager()
    var movieImages = [MovieImage]()
    var setMovieID : ((Int) -> (Int))?
    var movieID : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pagingCollectionView.dataSource = self
        pagingCollectionView.delegate = self
        pagingCollectionView.register(UINib(nibName: "PagingImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "pagingImageCollectionCell")
        pagingCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func getMovieImages() {
        networkProvider.getMovieImages(movieID: movieID) { results in

            self.movieImages = results
            
            self.pageControl.numberOfPages = self.movieImages.count
            self.pageControl.currentPage = 0
            self.pageControl.pageIndicatorTintColor = .gray
            self.pageControl.currentPageIndicatorTintColor = .white
            
            OperationQueue.main.addOperation {
                self.pagingCollectionView.reloadData()
            }
        }
    }
    
    func config(with movieID: Int) {
        self.movieID = movieID
        pagingCollectionView.reloadData()
    }

}

extension PagingTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pagingImageCollectionCell", for: indexPath) as! PagingImageCollectionViewCell
        let imagePath = "https://image.tmdb.org/t/p/w500\(movieImages[indexPath.row].file_path)"
        cell.pagingImageView.kf.setImage(with: URL(string: imagePath))
        return cell
    }
}

extension PagingTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.safeAreaLayoutGuide.layoutFrame.width
        let height = collectionView.safeAreaLayoutGuide.layoutFrame.height
        let size = CGSize(width: width, height: height)
        return size
    }
}

extension PagingTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) { // 컬렉션뷰를 스크롤하면 반복적으로 호출
        let width = scrollView.bounds.size.width // 너비 저장
        let x = scrollView.contentOffset.x + (width / 2.0) // 현재 스크롤한 x좌표 저장
        
        let newPage = Int(x / width)
        if pageControl.currentPage != newPage {
            pageControl.currentPage = newPage
        }
    }
}
