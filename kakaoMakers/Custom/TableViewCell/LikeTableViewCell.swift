//
//  LikeTableViewCell.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/17.
//

import UIKit

class LikeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heartImage: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setHeartImage(text: String) {
        
        let attributedString = NSMutableAttributedString(string: text)
        infoLabel.attributedText = attributedString
    }
    
}

