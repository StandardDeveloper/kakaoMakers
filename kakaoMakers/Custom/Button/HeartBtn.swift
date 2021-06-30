//
//  HeartBtn.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/29.
//

import UIKit

class HeartBtn: UIButton {

    var isFlag : Bool = true
    
    let activeImage = UIImage(systemName: "heart.fill")?.withTintColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)).withRenderingMode(.alwaysOriginal)
    let normalImage = UIImage(systemName: "heart")?.withTintColor(#colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)).withRenderingMode(.alwaysOriginal)
    
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
    
    func setFlag(_ newValue: Bool) {
        print("MyHeartBtn - setState() called / newValue: \(newValue)")
        self.isFlag = newValue
        print("+++++++++++++++++++++++++++", isFlag)
        self.setImage(self.isFlag ? activeImage : normalImage, for: .normal)
        self.isFlag.toggle()
        print("----------------------------", isFlag)
    }
    
}
