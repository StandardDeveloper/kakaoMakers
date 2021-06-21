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
    @IBOutlet weak var agreeBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setHeartImage()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setHeartImage() {
        
        let attributedString = NSMutableAttributedString(string: "")
        let labelImage = NSTextAttachment()
        labelImage.image = UIImage(named: "heart")
        labelImage.bounds = CGRect(x: 0, y: 0, width: 40, height: 40)
        attributedString.append(NSAttributedString(attachment: labelImage))
        heartImage.attributedText = attributedString
        heartImage.sizeToFit()
        
    }
        
}

