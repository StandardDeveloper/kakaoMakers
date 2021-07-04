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
    
    var heartBtnAction : ((Bool) -> Void)?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func likeBtnAction(_ sender: UIButton) {
        guard let idx = index else {return}
        if sender.isSelected {
            
        }
    }
}
