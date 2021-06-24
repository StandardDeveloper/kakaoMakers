//
//  PagingImageHeardView.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/24.
//

import UIKit

class PagingImageHeardView: UIView {

    @IBOutlet weak var pageControl: UIPageControl!

}

extension PagingImageHeardView: PagingImageViewControllerDelegate {
    func setupPageController(numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int) {
        pageControl.currentPage = index
    }
}
