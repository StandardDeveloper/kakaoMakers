//
//  CustomUIButton.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/16.
//

import UIKit

class CustomUIButton: UIButton {


    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5.0;
        self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.tintColor = UIColor.lightGray
        
        
    }

   
}
