//
//  AlarmHistoryTableViewCell.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/30.
//

import UIKit

class AlarmHistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var historyImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
