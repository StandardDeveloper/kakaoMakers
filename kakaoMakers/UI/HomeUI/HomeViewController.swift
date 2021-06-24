//
//  HomeViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/15.
//

import UIKit
import Tabman
import Pageboy

class HomeViewController: TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationSetup()
        viewSetup()
        
    }
    
    func viewSetup() {
        let recentlyVC =  self.storyboard?.instantiateViewController(withIdentifier: "recentlyVC") as! RecentlyViewController
        let mainHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "mainHomeVC") as! MainHomeViewController
        let commingSoonVC = self.storyboard?.instantiateViewController(withIdentifier: "commingSoonVC") as! CommingSoonViewController
        let likeVC = self.storyboard?.instantiateViewController(withIdentifier: "likeVC") as! LikeViewController
        
        viewControllers.append(recentlyVC)
        viewControllers.append(mainHomeVC)
        viewControllers.append(commingSoonVC)
        viewControllers.append(likeVC)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.backgroundView.style = .blur(style: .light)
        bar.backgroundColor = .white
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        bar.layout.interButtonSpacing = 40
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .intrinsic
        bar.indicator.weight = .light
        
        bar.buttons.customize {
            
            $0.tintColor = .lightGray
            $0.selectedTintColor = .black
            if #available(iOS 11, *) {
                $0.adjustsFontForContentSizeCategory = true
            }
        }
        
        bar.indicator.tintColor = .black
        addBar(bar, dataSource: self, at: .top)
    }
    
    func navigationSetup() {
        let logoImage = UIImage(named: "kakaoMakers.png")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = logoImageView

        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
}

extension HomeViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        //시작 페이지 설정
        scrollToPage(.at(index: 1), animated: true, completion: nil)
        
        let item = TMBarItem(title: "")
       
        if(index == 0) {
            item.title = "최근 본"
        }
        else if(index == 1) {
            item.title = "홈"
        }
        else if(index == 2) {
            item.title = "오픈예정"
        }
        else {
            item.title = "좋아요"
        }
        
        return item
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
}
