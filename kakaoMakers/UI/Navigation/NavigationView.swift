//
//  NavigationView.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/08.
//

import UIKit

class NavigationView: UINavigationController {
    
    static let navigationView = NavigationView()
    
    func navigationViewSetup(title: String, largeTitle: Bool, tintColor: UIColor){
        
        navigationItem.title = title
        navigationBar.prefersLargeTitles = largeTitle
        navigationBar.barTintColor = tintColor
    }
    
}
