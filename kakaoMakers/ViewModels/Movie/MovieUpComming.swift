//
//  MovieUpComming.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/22.
//

import Foundation

//어떤 데이트 불러온건지? -> 무비, 티비
struct MovieUpComming {
    let upComming: [Movie]
}

//테이블뷰에 들어가는 데이터
extension MovieUpComming {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowInSections(_ section: Int) -> Int {
        return self.upComming.count
    }
    
    func movieAtIndex(_ section: Int, index: Int) -> MovieViewModel {
        
        let upComming = self.upComming[index]
        return MovieViewModel(upComming)
    }
}
