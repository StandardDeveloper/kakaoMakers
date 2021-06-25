//
//  DetailMovieListViewModel.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/25.
//

import Foundation

struct DetailMovieViewModel {
    private let detailMovie: DetailMovie
}

extension DetailMovieViewModel {
    init(_ detailMovie: DetailMovie) {
        self.detailMovie = detailMovie
    }
}

extension DetailMovieViewModel {
    var title: String? {
        return self.detailMovie.title
    }
    var overview: String? {
        return self.detailMovie.overview
    }
    var poster_path: String? {
        return self.detailMovie.poster_path
    }
    var backdrop_path: String? {
        return self.detailMovie.backdrop_path
    }
    var vote_average: Double? {
        return self.detailMovie.vote_average
    }
    var vote_count: Int? {
        return self.detailMovie.vote_count
    }
    var release_data: String? {
        return self.detailMovie.release_date
    }
    var runtime: Int? {
        return self.detailMovie.runtime
    }
}
