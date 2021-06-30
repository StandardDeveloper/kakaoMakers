//
//  AlarmViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/15.
//

import UIKit
import Tabman
import Pageboy

class AlarmViewController: TabmanViewController {

    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSetup()
        navigationSetup()
    }
    
    func navigationSetup() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "알람"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.barTintColor = .white
    }
    
    func viewSetup() {
        let historyVC =  self.storyboard?.instantiateViewController(withIdentifier: "alarmHistoryVC") as! AlarmHistoryViewController
        let noticeVC = self.storyboard?.instantiateViewController(withIdentifier: "alarmNoticeVC") as! AlarmNoticeViewController
        
        viewControllers.append(historyVC)
        viewControllers.append(noticeVC)
   
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.backgroundView.style = .blur(style: .light)
        bar.backgroundColor = .white
        bar.largeContentTitle = "알림"
        bar.tintColor = .black
        //bar.layout.layoutGuide
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        bar.layout.interButtonSpacing = 10
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

}

extension AlarmViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        //시작 페이지 설정
        scrollToPage(.at(index: 0), animated: true, completion: nil)
        
        let item = TMBarItem(title: "")
       
        if(index == 0) {
            item.title = "알림내역"
        }
        else  {
            item.title = "공지사항"
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
