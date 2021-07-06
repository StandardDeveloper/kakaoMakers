//
//  MainHomeTableViewCell.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/22.
//

import UIKit

protocol MainHomeTableViewCellDelegate {
    func didPreasHeart(for index: Int, like: Bool)
}

class MainHomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var oderLabel: UILabel!
    @IBOutlet weak var likeBtn: HeartBtn!
    
    var delegate: MainHomeTableViewCellDelegate?
    var index: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func likeBtnAction(_ sender: UIButton) {
        guard let idx = index else {return}
        print("____________", sender.isSelected)
        print("////////////", idx)
        if likeBtn.isSelected {
            isTouched = true
            delegate?.didPreasHeart(for: idx, like: true)
        }else {
            isTouched = false
            delegate?.didPreasHeart(for: idx, like: false)
        }
        likeBtn.isSelected = !likeBtn.isSelected
        
    }
    
    var isTouched: Bool? {
        didSet {
            if isTouched == true {
                likeBtn.setImage(UIImage(systemName: "heart.fill")?.withTintColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)).withRenderingMode(.alwaysOriginal), for: .normal)
            } else{
                likeBtn.setImage(UIImage(systemName: "heart")?.withTintColor(#colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)).withRenderingMode(.alwaysOriginal), for: .normal)
            }
        }
    }
}
