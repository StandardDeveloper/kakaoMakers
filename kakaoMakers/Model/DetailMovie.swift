//
//  DetailMovie.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/16.
//

import Foundation

struct DetailMovie {
    
    var title: String
    var overview: String
    var poster_path: String
    var backdrop_path: String
    var vote_average: Double
    var vote_count: Int
    var release_date: String
    var runtime: Int
}

extension DetailMovie: Codable{
    
    enum DetailMovieCodingKeys: String,CodingKey {
        case title
        case overview
        case poster_path
        case backdrop_path
        case vote_average
        case vote_count
        case release_date
        case runtime
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DetailMovieCodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        overview = try container.decode(String.self, forKey: .overview)
        poster_path = try container.decode(String.self, forKey: .poster_path)
        backdrop_path = try container.decode(String.self, forKey: .backdrop_path)
        vote_average = try container.decode(Double.self, forKey: .vote_average)
        vote_count = try container.decode(Int.self, forKey: .vote_count)
        release_date = try container.decode(String.self, forKey: .release_date)
        runtime = try container.decode(Int.self, forKey: .runtime)
        
    }
    
}
