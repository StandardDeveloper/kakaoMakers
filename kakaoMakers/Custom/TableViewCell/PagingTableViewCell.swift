//
//  PagingTableViewCell.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/02.
//

import UIKit

class PagingTableViewCell: UITableViewCell {

    @IBOutlet weak var pagingCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
