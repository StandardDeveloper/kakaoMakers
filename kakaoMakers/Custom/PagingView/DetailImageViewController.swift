//
//  DetailImageViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/24.
//

import UIKit

class DetailImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? {
        didSet {
            self.imageView?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = image
    }

}
