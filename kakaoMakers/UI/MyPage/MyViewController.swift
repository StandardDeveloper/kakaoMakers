//
//  MyViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/15.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var myPageTableView: UITableView!
    
    var infoTitle =  ["휴대폰 번호", "알림/광고 동의 관리"]
    var infoTitle2 = ["현금영수증 정보 관리", "환불관리"]
    var infoTitle3 = ["버전정보", "오픈소스 라이센스", "개인정보 처리방침", "도움말 / 고객센터", "친구에게 공유하기"]
    var infoTitle4 = ["카카오 쇼핑안내"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myPageTableView.delegate = self
        myPageTableView.dataSource = self
        myPageTableView.rowHeight = UITableView.automaticDimension
        
        navigationSetup()
    }
    
    func navigationSetup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "마이"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.barTintColor = .white
    }
    
    @IBAction func moveLoginPage(_ sender: Any) {
        
//        let mainSB = UIStoryboard(name: "MyPage", bundle: nil)
//        let loginpageVC = mainSB.instantiateViewController(withIdentifier: "navVC") as! UINavigationController
//        loginpageVC.modalPresentationStyle = .fullScreen
//        present(loginpageVC, animated: true, completion: nil)
        
        let loginpageVC = self.storyboard?.instantiateViewController(withIdentifier: "navVC") as! UINavigationController
        loginpageVC.modalPresentationStyle = .fullScreen
        present(loginpageVC, animated: true, completion: nil)
    }
    
}

extension MyViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return infoTitle.count
        case 2:
            return infoTitle2.count
        case 3:
            return infoTitle3.count
        default:
            return infoTitle4.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let loginCell = myPageTableView.dequeueReusableCell(withIdentifier: "myPageLoginCell", for: indexPath) as! MyPageLoginTableViewCell
        let infoCell = myPageTableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            return loginCell
        case 1:
            infoCell.textLabel?.text = infoTitle[indexPath.row]
            return infoCell
        case 2:
            infoCell.textLabel?.text = infoTitle2[indexPath.row]
            return infoCell
        case 3:
            infoCell.textLabel?.text = infoTitle3[indexPath.row]
            return infoCell
        case 4:
            infoCell.textLabel?.text = infoTitle4[indexPath.row]
            return infoCell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.0
        default:
            return 10.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let v = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 10.0))
        v.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        return v
    }
    
    
}
