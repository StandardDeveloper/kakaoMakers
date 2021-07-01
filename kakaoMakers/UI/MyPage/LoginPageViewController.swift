//
//  LoginPageViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/01.
//

import UIKit

class LoginPageViewController: UIViewController {

    lazy var backButton: UIBarButtonItem = {
        let buttonIcon = UIImage(systemName: "chevron.backward")
        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(backBtn(_:)))
        button.image = buttonIcon
        button.tintColor = .black
        return button
    }()
    
    @objc func backBtn(_ sender:UIBarButtonItem!){
        dismiss(animated: true, completion: nil)
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationSetup()
    }
    
    func navigationSetup() {
        
        navigationItem.title = "로그인"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = self.backButton
    }

}
