//
//  NoticeViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/07.
//

import UIKit

class NoticeViewController: UIViewController {
    
    @IBOutlet weak var noticeTableView: UITableView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "NoticeTableViewCell", bundle: nil)
        noticeTableView.register(nibName, forCellReuseIdentifier: "noticeCell")
        
        noticeTableView.rowHeight = UITableView.automaticDimension
        
        noticeTableView.delegate = self
        noticeTableView.dataSource = self
        
        navgationSetup()
        lastTableViewCell()
        
    }
    
    func navgationSetup() {
        
        navigationItem.title = "알림/광고 동의 관리"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.leftBarButtonItem = self.backButton
    }
    
    func lastTableViewCell() {
        let footerView = UIView(frame: CGRect.zero)
        //footerView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        noticeTableView.tableFooterView = footerView
    }
    
}

extension NoticeViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = noticeTableView.dequeueReusableCell(withIdentifier: "noticeCell", for: indexPath) as! NoticeTableViewCell
        
        if indexPath.section == 0 {
            cell.titleLabel.text = "주문 정보 알림"
            cell.infoLabel.text = "주문한 상품의 배송알림, 문의에 대한 답변 등 주문과 관련된 정보를 받을 수 있습니다."
        }
        else if indexPath.section == 1 {
            cell.titleLabel.text = "이벤트 소식 알림"
            cell.infoLabel.text = "이벤트, 기획전, 추천상품 등 기분 좋은 생활에 도움이 되는 정보를 받을 수 있습니다."
        }
        else {
            cell.titleLabel.text = "좋아요톡 수신"
            cell.infoLabel.text = "메이커스 채널 추가하시고 제품 '좋아요'를 해보세요 메이커스 채널의 대화창이 제품에 저장되어 언제든지 쉽게 찾아보실 수 있어요~"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.0
        }
        else {
            return 10.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 10.0
        }
        else {
            return 0.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
        headerView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
        footerView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        return footerView
    }
}
