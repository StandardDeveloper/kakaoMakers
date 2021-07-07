//
//  WebViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/07.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    var navTitle: String = ""
    var webView: WKWebView!
    
    lazy var backButton: UIBarButtonItem = {
        let buttonIcon = UIImage(systemName: "chevron.backward")
        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(backBtn(_:)))
        button.image = buttonIcon
        button.tintColor = .black
        return button
    }()
    
    @objc func backBtn(_ sender: UIBarButtonItem!) {
        navigationController?.popViewController(animated: true)
    }
    
//    override func loadView() {
//        super.loadView()
//        webView = WKWebView(frame: self.view.frame)
//        self.view = self.webView
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView(frame: self.view.frame)
        self.view = self.webView

        navgationViewSetup()
        
        let url = URL(string: "https://www.naver.com")
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }
    
    func navgationViewSetup() {
        
        navigationItem.title = navTitle
        navigationItem.leftBarButtonItem = backButton
        navigationItem.largeTitleDisplayMode = .never
        
    }

   

}
