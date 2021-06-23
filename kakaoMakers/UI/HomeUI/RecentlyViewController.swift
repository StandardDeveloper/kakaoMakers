//
//  RecentlyViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/15.
//

import UIKit

class RecentlyViewController: UIViewController {

    @IBOutlet weak var recentlyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recentlyTableView.delegate = self
        recentlyTableView.dataSource = self
        
        recentlyTableView.rowHeight = UITableView.automaticDimension
        recentlyTableView.estimatedRowHeight = 500
     
    }
    
}

extension RecentlyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = recentlyTableView.dequeueReusableCell(withIdentifier: "recentlyCell", for: indexPath) as! RecentlyTableViewCell
            return cell
        }
        else {
            let cell = recentlyTableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
            return cell
        }
    }
    
    
    
}
