//
//  MainHomeTableViewCell.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/22.
//

import UIKit

class MainHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var oderLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        configView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configView() {
        likeBtn.translatesAutoresizingMaskIntoConstraints = false
        likeBtn.backgroundColor = .white
        likeBtn.tintColor = .black
        likeBtn.layer.cornerRadius = 5.0
        likeBtn.layer.borderWidth = 1.0
        likeBtn.layer.borderColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0).cgColor
    }
}
