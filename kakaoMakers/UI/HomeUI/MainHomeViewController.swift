//
//  MainHomeViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/15.
//

import UIKit
import Tabman
import Pageboy

class MainHomeViewController: TabmanViewController {

    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSetup()
    
    }
    
    func viewSetup() {
        let mainHomeAllVC =  self.storyboard?.instantiateViewController(withIdentifier: "mainHomeAllVC") as! MainHomeAllViewController
        let mainHomeNewVC = self.storyboard?.instantiateViewController(withIdentifier: "mainHomeNewVC") as! MainHomeNewViewController
        let mainHomeCategoryVC = self.storyboard?.instantiateViewController(withIdentifier: "mainHomeCategoryVC") as! MainHomeCategoryViewController
       
        
        viewControllers.append(mainHomeAllVC)
        viewControllers.append(mainHomeNewVC)
        viewControllers.append(mainHomeCategoryVC)
       
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.backgroundView.style = .blur(style: .light)
        bar.backgroundColor = .white
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        bar.layout.interButtonSpacing = 40
        //bar.layout.transitionStyle = .snap
        //bar.layout.contentMode = .intrinsic
        //bar.indicator.weight = .light
        
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

extension MainHomeViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        //시작 페이지 설정
        scrollToPage(.at(index: 0), animated: true, completion: nil)
        
        let item = TMBarItem(title: "")
       
        if(index == 0) {
            item.title = "전체"
        }
        else if(index == 1) {
            item.title = "신규"
        }
        else {
            item.title = "카테고리"
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
