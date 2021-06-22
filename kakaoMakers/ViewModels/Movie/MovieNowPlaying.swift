//
//  MovieNowPlaying.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/22.
//

import Foundation

struct MovieNowPlaying {
    let nowPlaying: [Movie]
}

//테이블뷰에 들어가는 데이터
extension MovieNowPlaying {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowInSections(_ section: Int) -> Int {
        return self.nowPlaying.count
    }
    
    func movieAtIndex(_ section: Int, index: Int) -> MovieViewModel {
        
        let nowPlaying = self.nowPlaying[index]
        return MovieViewModel(nowPlaying)
    }
}
