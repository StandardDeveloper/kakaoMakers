//
//  PagingImageViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/24.
//

import UIKit

//delegeate가 없어서 커스텀으로 클래스 제작
protocol PagingImageViewControllerDelegate: AnyObject {
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}

class PagingImageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    



}
