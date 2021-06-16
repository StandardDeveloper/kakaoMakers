//
//  Movie.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/16.
//

import Foundation

struct Movie {
    var id: Int
    var title: String
    var original_language: String
    var vote_average: Double
    var release_date: String
    var overview: String
    var poster_path: String
}

extension Movie: Codable{
    
    enum MovieCodingKeys: String,CodingKey {
        case id
        case title
        case original_language
        case vote_average
        case release_date
        case overview
        case poster_path
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        original_language = try container.decode(String.self, forKey: .original_language)
        vote_average = try container.decode(Double.self, forKey: .vote_average)
        release_date = try container.decode(String.self, forKey: .release_date)
        overview = try container.decode(String.self, forKey: .overview)
        poster_path = try container.decode(String.self, forKey: .poster_path)
    }
}

struct MovieResults {
    var page: Int
    var results: [Movie]
}

extension MovieResults: Codable {
    
    enum MovieResultsCodingKeys: String, CodingKey {
        case page
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieResultsCodingKeys.self)
        
        page = try container.decode(Int.self, forKey: .page)
        results = try container.decode([Movie].self, forKey: .results)
    }
    
}
