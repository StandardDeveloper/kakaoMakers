//
//  MovieListViewModel.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/19.
//

import Foundation

struct MovieViewModel {
    private let movie: Movie
}

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
