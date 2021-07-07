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
        footerView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        noticeTableView.tableFooterView = footerView
    }
    
}

extension NoticeViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = noticeTableView.dequeueReusableCell(withIdentifier: "noticeCell", for: indexPath) as! NoticeTableViewCell
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
        headerView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        return headerView
    }
}
