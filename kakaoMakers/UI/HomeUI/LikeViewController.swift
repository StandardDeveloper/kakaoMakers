//
//  LikeViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/15.
//

import UIKit

class LikeViewController: UIViewController {

    @IBOutlet weak var likeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        likeTableView.delegate = self
        likeTableView.dataSource = self
        
    }
}

extension LikeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            likeTableView.rowHeight = 580
            let cell = likeTableView.dequeueReusableCell(withIdentifier: "likeCell", for: indexPath) as! LikeTableViewCell
            return cell
        }
        else {
            likeTableView.rowHeight = 130
            
            let cell = likeTableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! LikeInfoTableViewCell
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10.0
        }
        else {
            return 1.0
        }
    }
    
    
}
