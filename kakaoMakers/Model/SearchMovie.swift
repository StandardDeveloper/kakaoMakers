//
//  SearchMovie.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/05.
//

import Foundation

struct SearchMovie {

    var title: String
    var release_date: String
    var poster_path: String
    var id: Int
}

extension SearchMovie: Codable{
    
    enum SearchMovieCodingKeys: String,CodingKey {
        case title
        case release_date
        case poster_path
        case id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SearchMovieCodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        release_date = try container.decode(String.self, forKey: .release_date)
        poster_path = try container.decode(String.self, forKey: .poster_path)
        id = try container.decode(Int.self, forKey: .id)
    }
}

struct SearchMovieResults {
    var page: Int
    var results: [SearchMovie]
}

extension SearchMovieResults: Codable {
    
    enum SearchMovieResultsCodingKeys: String, CodingKey {
        case page
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SearchMovieResultsCodingKeys.self)
        
        page = try container.decode(Int.self, forKey: .page)
        results = try container.decode([SearchMovie].self, forKey: .results)
    }
    
}
