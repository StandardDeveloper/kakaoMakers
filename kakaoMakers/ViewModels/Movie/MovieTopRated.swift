//
//  MovieTopRated.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/23.
//

import Foundation

//어떤 데이트 불러온건지? -> 무비, 티비
struct MovieTopRated {
    let topRated: [Movie]
}

//테이블뷰에 들어가는 데이터
extension MovieTopRated {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowInSections(_ section: Int) -> Int {
        return self.topRated.count
    }
    
    func movieAtIndex(_ section: Int, index: Int) -> MovieViewModel {
        
        let topRated = self.topRated[index]
        return MovieViewModel(topRated)
    }
}
