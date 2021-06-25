//
//  DetailTableViewCell.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/25.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var heartBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
