//
//  CommingSoonTableViewCell.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/16.
//

import UIKit

class CommingSoonTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var alarmBtn: UIButton!
        
    func textColorChange (firstText: String, secondText: String) {
        
        let attributedStr = NSMutableAttributedString(string: likeLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.red, range: (likeLabel.text! as NSString).range(of: firstText))
        attributedStr.addAttribute(.foregroundColor, value: UIColor.blue, range: (likeLabel.text! as NSString).range(of: secondText))
        
        likeLabel.attributedText = attributedStr
        
    }

}
