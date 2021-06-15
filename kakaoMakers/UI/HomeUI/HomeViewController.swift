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
        
    
//        let recommendationVC =  self.storyboard?.instantiateViewController(withIdentifier: "recommendationVC") as! RecommendationViewController
//        let newProductVC = self.storyboard?.instantiateViewController(withIdentifier: "newProductVC") as! NewProductViewController
//        let bestVC = self.storyboard?.instantiateViewController(withIdentifier: "bestVC") as! BestViewController
//        let shoppingVC = self.storyboard?.instantiateViewController(withIdentifier: "shoppingVC") as! ShoppingViewController
//        let weekBenefitVC = self.storyboard?.instantiateViewController(withIdentifier: "weekBenefitVC") as! WeekBenefitViewController
//
//
//        viewControllers.append(recommendationVC)
//        viewControllers.append(newProductVC)
//        viewControllers.append(bestVC)
//        viewControllers.append(shoppingVC)
//        viewControllers.append(weekBenefitVC)
//
//        self.dataSource = self
//
//        let bar = TMBar.ButtonBar()
//        bar.backgroundColor = .white
//        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 16.0, bottom: 0, right: 16.0)
//        bar.layout.interButtonSpacing = 10
//        bar.layout.transitionStyle = .snap
//        bar.layout.contentMode = .fit
//
//        bar.buttons.customize {
//
//            $0.tintColor = .lightGray
//            $0.selectedTintColor = .purple
//               if #available(iOS 11, *) {
//                   $0.adjustsFontForContentSizeCategory = true
//            }
//        }
//
//        bar.indicator.tintColor = .purple
//        addBar(bar, dataSource: self, at: .top)
//
    }

}
