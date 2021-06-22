//
//  MainHomeCategoryViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/19.
//

import UIKit
import Tabman
import Pageboy

class MainHomeCategoryViewController: TabmanViewController {

    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            viewSetup()
    }
    
    func viewSetup() {
        let foodCategoryVC =  self.storyboard?.instantiateViewController(withIdentifier: "foodCategoryVC") as! FoodCategoryViewController
        let beautyCategoryVC = self.storyboard?.instantiateViewController(withIdentifier: "beautyCategoryVC") as! BeautyCategoryViewController
        let livingCategoryVC = self.storyboard?.instantiateViewController(withIdentifier: "livingCategoryVC") as! LivingCategoryViewController
        let fashionCategoryVC = self.storyboard?.instantiateViewController(withIdentifier: "fashionCategoryVC") as! FashionCategoryViewController
        let techCategoryVC = self.storyboard?.instantiateViewController(identifier: "techCategoryVC") as! TechCategoryViewController
    
       
        viewControllers.append(foodCategoryVC)
        viewControllers.append(beautyCategoryVC)
        viewControllers.append(livingCategoryVC)
        viewControllers.append(fashionCategoryVC)
        viewControllers.append(techCategoryVC)
        
        self.dataSource = self
        
        let bar = TMBar.TabBar()
        bar.backgroundView.style = .blur(style: .light)
        bar.backgroundColor = .white
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
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
    
}

extension MainHomeCategoryViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        //시작 페이지 설정
        scrollToPage(.at(index: 0), animated: true, completion: nil)
        
        let item = TMBarItem(title: "")
       
        if index == 0 {
            item.title = "푸드"
            item.image = UIImage(named: "chef")
        }
        else if index == 1 {
            item.title = "뷰티"
            item.image = UIImage(named: "skincare")
        }
        else if index == 2 {
            item.title = "생활"
            item.image = UIImage(named: "home")
        }
        else if index == 3 {
            item.title = "패션・잡화"
            item.image = UIImage(named: "tshirt")
        }
        else {
            item.title = "테크・가전"
            item.image = UIImage(named: "monitor")
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

