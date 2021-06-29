//
//  DetailMovieInfo.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/25.
//

import Foundation

struct DetailMovieInfo {
    let detailMovieInfo: [DetailMovie]
}

//테이블뷰에 들어가는 데이터
extension DetailMovieInfo {
    var numberOfSections: Int {
        return 3
    }
    
    func numberOfRowInSections(_ section: Int) -> Int {
        return self.detailMovieInfo.count
    }
    
    func movieAtIndex(_ section: Int, index: Int) -> DetailMovieViewModel {
        let detailMovieInfo = self.detailMovieInfo[index]
        return DetailMovieViewModel(detailMovieInfo)
    }
}
