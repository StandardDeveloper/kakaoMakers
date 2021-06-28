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
        configBtn()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configBtn() {
        heartBtn.layer.cornerRadius = heartBtn.layer.frame.size.width / 2
        heartBtn.layer.borderWidth = 1
        heartBtn.layer.borderColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0).cgColor
        let heart : UIImage = UIImage(named:"heart")!
        heartBtn.imageEdgeInsets = UIEdgeInsets(top: 35, left: 35, bottom: 35, right: 35)
        heartBtn.setImage(heart, for: UIControl.State.normal)
    }
}
