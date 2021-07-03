//
//  AlarmHistoryTableViewCell.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/30.
//

import UIKit

class AlarmHistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var historyImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

//    func settingData(isClicked :ExpandingTableViewCellContent, title : String, overview : String, release_data : String, imagePath : String)
//       
//       {
//           if isClicked.expanded == true
//           {
//            infoLabel.numberOfLines = 3
//            titleLabel.text = title
//            infoLabel.text = overview
//            dateLabel.text = release_data
//            historyImageView.kf.setImage(with: URL(string: imagePath))
//            
//               
//           }
//           else
//           {
//            infoLabel.numberOfLines = 0
//            titleLabel.text = "Test"
//            infoLabel.text = overview
//            dateLabel.text = release_data
//            historyImageView.kf.setImage(with: URL(string: imagePath))
//            
//           }
//       }
//    
}
