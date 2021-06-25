//
//  PagingImageViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/24.
//

import UIKit

//delegeate가 없어서 커스텀으로 클래스 제작
protocol PagingImageViewControllerDelegate: AnyObject {
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}

class PagingImageViewController: UIPageViewController {

    var movieIndex: Int = 0
    var networkProvider = MovieNetworkManager()
    var images: [UIImage]?
    //var URLImage = [UIImage]()
    weak var pageViewControllerDelegate: PagingImageViewControllerDelegate?
    
    struct Storyboard {
        static let pagingImageViewController = "PagingImageViewController"
    }
    
    lazy var controllers: [UIViewController] = {
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        var controllers = [UIViewController]()
                
        if let images = self.images {
            for image in images {
                let productImageVC = storyboard.instantiateViewController(withIdentifier: Storyboard.pagingImageViewController)
                    controllers.append(productImageVC)
                }
            }
                
        self.pageViewControllerDelegate?.setupPageController(numberOfPages: controllers.count)
        return controllers

    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        delegate = self
        
        print("-------------", movieIndex)
        getDetailMovie()
     
    }
    
    func getDetailMovie() {
        
//        networkProvider.getDetailMovie(movieID: movieIndex) { [self] results in
//
//            let posterImagePathURL = URL(string: "https://image.tmdb.org/t/p/w500\(results.poster_path)")
//            let PosterData = try! Data(contentsOf: posterImagePathURL!)
//            images?.append(UIImage(data: PosterData)!)
//
//            let backImagePathURL = URL(string: "https://image.tmdb.org/t/p/w500\(results.backdrop_path)")
//            let backdropData = try! Data(contentsOf: backImagePathURL!)
//            images?.append(UIImage(data: backdropData)!)
//
//        }
    }
    
    func turnToPage(index: Int) {
        
        let controller = controllers[index]
        var direction = UIPageViewController.NavigationDirection.forward
        
        if let currentVC = viewControllers?.first {
            let currentIndex = controllers.firstIndex(of: currentVC)!
            if (currentIndex > index) {
                direction = .reverse
            }
        }
        
        self.configureDisplaying(viewController: controller)
        
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    }
    
    func configureDisplaying(viewController: UIViewController)
        {
            for (index, vc) in controllers.enumerated() {
                if viewController === vc {
                    if let productImageVC = viewController as? DetailImageViewController {
                        productImageVC.image = self.images?[index]
                        
                        self.pageViewControllerDelegate?.turnPageController(to: index)
                    }
                }
            }
        }
    
}

extension PagingImageViewController: UIPageViewControllerDataSource {
 
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.firstIndex(of: viewController) {
            if index > 0 {
                return controllers[index - 1]
            }
        }
        
        return controllers.last
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.firstIndex(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            }
        }
        
        return controllers.first
    }
}

extension PagingImageViewController: UIPageViewControllerDelegate {
 
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        self.configureDisplaying(viewController: pendingViewControllers.first as! DetailImageViewController)
        
    
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if (!completed) {
            self.configureDisplaying(viewController: previousViewControllers.first as! DetailImageViewController)
        }
    }
    
}

