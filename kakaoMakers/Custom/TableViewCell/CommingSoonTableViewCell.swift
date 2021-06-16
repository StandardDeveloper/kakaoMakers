//
//  CommingSoonTableViewCell.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/16.
//

import UIKit
import ExpandableLabel

class CommingSoonTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsLabel: ExpandableLabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var alarmBtn: UIButton!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentsLabel.collapsed = true
        contentsLabel.text = nil
    }
    
    func textColorChange (firstText: String, secondText: String) {
        
        let attributedStr = NSMutableAttributedString(string: likeLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.red, range: (likeLabel.text! as NSString).range(of: firstText))
        attributedStr.addAttribute(.foregroundColor, value: UIColor.blue, range: (likeLabel.text! as NSString).range(of: secondText))
        
        likeLabel.attributedText = attributedStr
        
    }

}

