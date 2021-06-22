//
//  Movie.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/16.
//

import Foundation

struct MovieList: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int?
    let title: String?
    let original_language: String?
    let vote_average: Double?
    let release_date: String?
    let overview: String?
    let poster_path: String?
}
