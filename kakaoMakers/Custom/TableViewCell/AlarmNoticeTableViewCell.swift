//
//  AlarmNoticeTableViewCell.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/01.
//

import UIKit

class AlarmNoticeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
