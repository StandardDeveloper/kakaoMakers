//
//  LoginPageViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/01.
//

import UIKit
import Moya
import SwiftyJSON
import BRYXBanner

class LoginPageViewController: UIViewController {
    
    @IBOutlet weak var idTextfield: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var findIDBtn: UIButton!
    @IBOutlet weak var findPWBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var loginTypeTextlabel: UILabel!
    @IBOutlet weak var partitionView: UIView!
    @IBOutlet weak var partitionView2: UIView!
    @IBOutlet weak var partitionView3: UIView!
    @IBOutlet weak var facebookLoginBtn: UIButton!
    @IBOutlet weak var googleLoginBtn: UIButton!
    @IBOutlet weak var appleLoginBtn: UIButton!
    @IBOutlet weak var naverLoginBtn: UIButton!
    @IBOutlet weak var kakaoLoginBtn: UIButton!
    
    let provider = MoyaProvider<AuthAPI>()
    let userDefaults = UserDefaults()
    
    lazy var backButton: UIBarButtonItem = {
        let buttonIcon = UIImage(systemName: "xmark")
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
        uiSetup()
    }
    
    func navigationSetup() {
        
        navigationItem.title = "로그인"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = self.backButton
    }
    
    func uiSetup() {
        
        idTextfield.translatesAutoresizingMaskIntoConstraints = false
        idTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        idTextfield.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        idTextfield.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        idTextfield.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pwTextfield.translatesAutoresizingMaskIntoConstraints = false
        pwTextfield.topAnchor.constraint(equalTo: idTextfield.bottomAnchor, constant: 10).isActive = true
        pwTextfield.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        pwTextfield.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        pwTextfield.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pwTextfield.isSecureTextEntry = true
        
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.layer.cornerRadius = 5
        loginBtn.topAnchor.constraint(equalTo: pwTextfield.bottomAnchor, constant: 20).isActive = true
        loginBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        loginBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        loginBtn.backgroundColor = .black//UIColor(red: 80/255, green: 10/255, blue: 110/255, alpha: 1.0)
        loginBtn.layer.borderWidth = 1
        
        findIDBtn.translatesAutoresizingMaskIntoConstraints = false
        findIDBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 10).isActive = true
        findIDBtn.rightAnchor.constraint(equalTo: partitionView.leftAnchor, constant: -20).isActive = true
        findIDBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        findIDBtn.tintColor = .darkGray
        
        partitionView.translatesAutoresizingMaskIntoConstraints = false
        partitionView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        partitionView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        partitionView.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 30).isActive = true
        partitionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        partitionView.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
        
        findPWBtn.translatesAutoresizingMaskIntoConstraints = false
        findPWBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 10).isActive = true
        findPWBtn.leftAnchor.constraint(equalTo: partitionView.leftAnchor, constant: 20).isActive = true
        findPWBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        findPWBtn.tintColor = .darkGray
        
        signupBtn.translatesAutoresizingMaskIntoConstraints = false
        signupBtn.layer.cornerRadius = 5
        signupBtn.topAnchor.constraint(equalTo: partitionView.bottomAnchor, constant: 30).isActive = true
        signupBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        signupBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        signupBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signupBtn.setTitleColor(.black, for: UIControl.State.normal)
        signupBtn.backgroundColor = .white
        signupBtn.layer.borderColor = UIColor(.black).cgColor
        signupBtn.layer.borderWidth = 1
        
        partitionView2.translatesAutoresizingMaskIntoConstraints = false
        partitionView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        partitionView2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        partitionView2.topAnchor.constraint(equalTo: findPWBtn.bottomAnchor, constant: 100).isActive = true
        partitionView2.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        partitionView2.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
        
        loginTypeTextlabel.translatesAutoresizingMaskIntoConstraints = false
        loginTypeTextlabel.font = UIFont.italicSystemFont(ofSize: 13)
        loginTypeTextlabel.topAnchor.constraint(equalTo: findPWBtn.bottomAnchor, constant: 93).isActive = true
        loginTypeTextlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        partitionView3.translatesAutoresizingMaskIntoConstraints = false
        partitionView3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        partitionView3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        partitionView3.topAnchor.constraint(equalTo: findPWBtn.bottomAnchor, constant: 100).isActive = true
        partitionView3.leftAnchor.constraint(equalTo: loginTypeTextlabel.rightAnchor, constant: 10).isActive = true
        partitionView3.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
        
        facebookLoginBtn.translatesAutoresizingMaskIntoConstraints = false
        facebookLoginBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        facebookLoginBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        facebookLoginBtn.topAnchor.constraint(equalTo: loginTypeTextlabel.bottomAnchor, constant: 20).isActive = true
        facebookLoginBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        googleLoginBtn.translatesAutoresizingMaskIntoConstraints = false
        googleLoginBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        googleLoginBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        googleLoginBtn.topAnchor.constraint(equalTo: loginTypeTextlabel.bottomAnchor, constant: 20).isActive = true
        googleLoginBtn.leftAnchor.constraint(equalTo: facebookLoginBtn.rightAnchor, constant: 35).isActive = true
        
        appleLoginBtn.translatesAutoresizingMaskIntoConstraints = false
        appleLoginBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        appleLoginBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        appleLoginBtn.topAnchor.constraint(equalTo: loginTypeTextlabel.bottomAnchor, constant: 20).isActive = true
        appleLoginBtn.leftAnchor.constraint(equalTo: googleLoginBtn.rightAnchor, constant: 35).isActive = true
        
        naverLoginBtn.translatesAutoresizingMaskIntoConstraints = false
        naverLoginBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        naverLoginBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        naverLoginBtn.topAnchor.constraint(equalTo: loginTypeTextlabel.bottomAnchor, constant: 20).isActive = true
        naverLoginBtn.leftAnchor.constraint(equalTo: appleLoginBtn.rightAnchor, constant: 35).isActive = true
        
        kakaoLoginBtn.translatesAutoresizingMaskIntoConstraints = false
        kakaoLoginBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        kakaoLoginBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        kakaoLoginBtn.topAnchor.constraint(equalTo: loginTypeTextlabel.bottomAnchor, constant: 20).isActive = true
        kakaoLoginBtn.leftAnchor.constraint(equalTo: naverLoginBtn.rightAnchor, constant: 35).isActive = true
        
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
     
        provider.request(.login(email: idTextfield.text!, password: pwTextfield.text!)) { response in
            
            switch response {
            
            case .success(let res):
                if res.statusCode != 200 {
                    
                    let banner = Banner(title: "", subtitle: "아이디, 비밀번호 확인해주세요.", image: UIImage(named: "Icon"), backgroundColor: UIColor(red:255.0/255.0, green:222.0/255.0, blue:230.0/255.0, alpha:1.000))
                    banner.dismissesOnTap = true
                    banner.textColor = UIColor(red:160.0/255.0, green:8.0/255.0, blue:8.0/255.0, alpha:1.000)
                    banner.show(duration: 2.0)
                }
                else {
                    let jsonData = JSON(res.data)
                    let tokenInfo = jsonData["token"].string!
                    UserDefaults.standard.set(tokenInfo, forKey: "token")
                    self.dismiss(animated: true, completion: nil)
                }
                
            case .failure(let err):
                print(err)
            }
        }
    }
}
