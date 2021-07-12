//
//  SignUPViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/02.
//

import UIKit
import Moya

class SignUPViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    @IBOutlet weak var confirmPWTextfield: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    
    let provider = MoyaProvider<AuthAPI>()
    
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
        signupPageUISetup()
    }
    
    func navigationSetup() {
        
        navigationItem.title = "회원가입"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = self.backButton
    }
    
    //이메일 형식 확인
    func isValidEmail(email : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func signupPageUISetup() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        nameTextfield.translatesAutoresizingMaskIntoConstraints = false
        nameTextfield.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        nameTextfield.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nameTextfield.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        emailTextfield.translatesAutoresizingMaskIntoConstraints = false
        emailTextfield.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        emailTextfield.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextfield.topAnchor.constraint(equalTo: nameTextfield.bottomAnchor, constant: 10).isActive = true
        emailTextfield.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        pwLabel.translatesAutoresizingMaskIntoConstraints = false
        pwLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pwLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        pwLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10).isActive = true
        pwLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        pwTextfield.translatesAutoresizingMaskIntoConstraints = false
        pwTextfield.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        pwTextfield.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pwTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: 10).isActive = true
        pwTextfield.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        pwTextfield.isSecureTextEntry = true
        
        confirmPWTextfield.translatesAutoresizingMaskIntoConstraints = false
        confirmPWTextfield.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        confirmPWTextfield.heightAnchor.constraint(equalToConstant: 40).isActive = true
        confirmPWTextfield.topAnchor.constraint(equalTo: pwTextfield.bottomAnchor, constant: 10).isActive = true
        confirmPWTextfield.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        confirmPWTextfield.isSecureTextEntry = true
        
        signupBtn.translatesAutoresizingMaskIntoConstraints = false
        signupBtn.layer.cornerRadius = 5
        signupBtn.topAnchor.constraint(equalTo: confirmPWTextfield.bottomAnchor, constant: 30).isActive = true
        signupBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        signupBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        signupBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signupBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        signupBtn.backgroundColor = .black
        
    }
    @IBAction func signupBtn(_ sender: Any) {
        provider.request(.signup(name: nameTextfield.text!, email: emailTextfield.text!, password: pwTextfield.text!)) { [self] response in
            
            switch response {
            
            case .success(let res):
                
                if res.statusCode != 200 {
                    let alertVC = UIAlertController(title: "회원가입 오류", message: "네트워크 확인", preferredStyle: UIAlertController.Style.alert)
                    let alertOK = UIAlertAction(title: "확인", style: .default, handler: nil)
                    alertVC.addAction(alertOK)
                    self.present(alertVC, animated: true, completion: nil)
                    
                }
                else {
                    let alertVC = UIAlertController(title: "회원가입 오류", message: "입력한 정보를 확인 해주세요.", preferredStyle: UIAlertController.Style.alert)
                    let alertOK = UIAlertAction(title: "확인", style: .default, handler: nil)
                    alertVC.addAction(alertOK)
                    
                    if nameTextfield.text == "" || emailTextfield.text == "" || pwTextfield.text == "" || confirmPWTextfield.text == "" {
                        self.present(alertVC, animated: true, completion: nil)
                    }
                    else if isValidEmail(email : emailTextfield.text!) == false {
                        self.present(alertVC, animated: true, completion: nil)
                    }
                    else if pwTextfield.text! != confirmPWTextfield.text! {
                        self.present(alertVC, animated: true, completion: nil)
                    }
                    else {
                        
                        let alertVC = UIAlertController(title: "회원가입 완료", message: "회원가입을 축하해요.", preferredStyle: UIAlertController.Style.alert)
                        let alertOK = UIAlertAction(title: "로그인 화면으로 이동", style: .default) { action in
                            
                            self.navigationController?.popViewController(animated: true)
                            
                        }
                        alertVC.addAction(alertOK)
                        self.present(alertVC, animated: true, completion: nil)
                    }
                }
            
            case .failure(let err):
                print(err)
            }
            
        }
    }
    
}
