//
//  FindPWViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/02.
//

import UIKit

class FindPWViewController: UIViewController {

    lazy var backButton: UIBarButtonItem = {
        let buttonIcon = UIImage(systemName: "chevron.backward")
        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(backBtn(_:)))
        button.image = buttonIcon
        button.tintColor = .black
        return button
    }()
    
    @objc func backBtn(_ sender:UIBarButtonItem!){
        navigationController?.popViewController(animated: true)
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationSetup()
    }
    
    func navigationSetup() {
        
        navigationItem.title = "비밀번호 찾기"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = self.backButton
    }

}
