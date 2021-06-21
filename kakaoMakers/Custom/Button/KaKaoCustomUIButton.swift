//
//  KaKaoCustomUIButton.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/21.
//

import UIKit

class KaKaoCustomUIButton: UIButton {

    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 25.0;
        self.backgroundColor = UIColor(red: 244/255, green: 211/255, blue: 71/255, alpha: 1)
        self.tintColor = UIColor.black
        
        
    }

}
