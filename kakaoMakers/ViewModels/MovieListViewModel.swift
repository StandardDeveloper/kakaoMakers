//
//  MovieListViewModel.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/19.
//

import Foundation

//어떤 데이트 불러온건지? -> 무비, 티비
struct MovieListViewModel {
    let nowplaying: [Movie]
}

//테이블뷰에 들어가는 데이터
extension MovieListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowInSections(_ section: Int) -> Int {
        
        return self.nowplaying.count
        
    }
    
    func movieAtIndex(_ section: Int, index: Int) -> MovieViewModel {
        
        let nowplaying = self.nowplaying[index]
        return MovieViewModel(nowplaying)
    }
}

//무비 안에 있는 각각에 데이터
struct MovieViewModel {
    private let movie: Movie
}

//무비 데이터 초기화
extension MovieViewModel {
    init(_ movie: Movie) {
        self.movie = movie
    }
}

extension MovieViewModel {
    var title: String? {
        return self.movie.title
    }
    var id: Int? {
        return self.movie.id
    }
    var original_language: String? {
        return self.movie.original_language
    }
    var vote_average: Double? {
        return self.movie.vote_average
    }
    var release_data: String? {
        return self.movie.release_date
    }
    var overview: String? {
        return self.movie.overview
    }
    var poster_path: String? {
        return self.movie.poster_path
    }
    
}

