//
//  HeartBtn.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/29.
//

import UIKit

class HeartBtn: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    
        backgroundColor = .white
        layer.cornerRadius = 5.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0).cgColor
    }
}
