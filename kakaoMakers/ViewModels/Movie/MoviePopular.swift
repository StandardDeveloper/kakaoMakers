//
//  MoviePopular.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/23.
//

import Foundation

//어떤 데이트 불러온건지? -> 무비, 티비
struct MoviePopular {
    let popular: [Movie]
}

//테이블뷰에 들어가는 데이터
extension MoviePopular {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowInSections(_ section: Int) -> Int {
        return self.popular.count
    }
    
    func movieAtIndex(_ section: Int, index: Int) -> MovieViewModel {
        
        let popular = self.popular[index]
        return MovieViewModel(popular)
    }
}
