//
//  NoticeTableViewCell.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/07.
//

import UIKit

protocol NoticeTableViewCellDelegate {
    func didPreasSwitchBtn(section: Int, for index: Int, switchBtn: Bool)
}

class NoticeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var switchBtn: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
