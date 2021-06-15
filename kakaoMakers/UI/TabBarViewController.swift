//
//  TabBarViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/15.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarBackgroundColor()
    }
    
    
    func setTabBarBackgroundColor() {
        tabBar.barTintColor = UIColor(cgColor: CGColor(red: 35/255, green: 34/255, blue: 35/255, alpha: 1))
        tabBar.tintColor = .white
        tabBar.isTranslucent = false
    }
    
}
