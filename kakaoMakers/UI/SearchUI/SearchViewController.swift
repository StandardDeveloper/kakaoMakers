//
//  SearchViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/15.
//
import UIKit

class SearchViewController: UIViewController{

    @IBOutlet weak var searchCollectionView: UICollectionView!

    var networkProvider = MovieNetworkManager()
    private var movieListVM: MovieNowPlaying!
    var searchMovie: [SearchMovie] = []
    
    let searchController = UISearchController(searchResultsController: nil)

    let lineSpacing: CGFloat = 5
    let inset: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchBar.placeholder = "어떤 제품을 찾으시나요?"
        navigationItem.title = "검색"
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        //searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self

        let nibName = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        searchCollectionView.register(nibName, forCellWithReuseIdentifier: "categoryCollectionViewCell")
        
        getMovieData()
    }
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }


    func getMovieData() {

        networkProvider.getMovies(target: .nowPlaying) { results in

            self.movieListVM = MovieNowPlaying(nowPlaying: results)
            
            OperationQueue.main.addOperation {
                self.searchCollectionView.reloadData()
            }
        }
    }
    
    func getSearchMovie(title: String) {
        networkProvider.getSearchMovie(title: title) { results in

            self.searchMovie = results
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchText = searchController.searchBar.text else { return }
        print(searchText)
        getSearchMovie(title: searchText)
        self.searchCollectionView.reloadData()
    }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "tttttt", for: indexPath) as! SearchCollectionReusableView
        headerview.titleLabel.text = "금주 상품"
        return headerview
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.movieListVM == nil ? 0 : self.movieListVM.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isFiltering {
            return self.searchMovie.count
        }
        else {
            print("===========",section)
            return self.movieListVM.numberOfRowInSections(section)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        if isFiltering {
            cell.titleLabel.text = searchMovie[indexPath.row].title
            cell.priceLabel.text = searchMovie[indexPath.row].release_date
            let imagePath = "https://image.tmdb.org/t/p/w500\(searchMovie[indexPath.row].poster_path)"
            cell.posterImageView.kf.setImage(with: URL(string: imagePath))
            return cell
        }
        else {
            let movieVM = self.movieListVM.movieAtIndex(indexPath.section, index: indexPath.row)
            let imagePath = "https://image.tmdb.org/t/p/w500\(movieVM.poster_path!)"
            cell.posterImageView.kf.setImage(with: URL(string: imagePath))
            cell.titleLabel.text = movieVM.title
            cell.priceLabel.text = movieVM.release_data
            return cell
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let homeSB = UIStoryboard(name: "Home", bundle: nil)
        let detailVC = homeSB.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        
        if isFiltering {
            detailVC.movieId = searchMovie[indexPath.row].id
            navigationController?.pushViewController(detailVC, animated: true)
        }
        else {
            detailVC.movieId = movieListVM.movieAtIndex(indexPath.section, index: indexPath.row).id!
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {

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


