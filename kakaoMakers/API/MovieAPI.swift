//
//  MovieAPI.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/16.
//

import Foundation
import Moya

enum MovieAPI {
    case nowPlaying
    case topRated
    case upComing
    case latest
    case popular
    case details(id: Int)
}

extension MovieAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: MovieNetworkManager.MAINURL) else{ fatalError("URL Error") }
        return url
    }
    
    var path: String {
        
        switch self {
        
        case .nowPlaying:
            return "/movie/now_playing"
        case .topRated:
            return "/movie/top_rated"
        case .upComing:
            return "/movie/upcoming"
        case .latest:
            return "/movie/latest"
        case .popular:
            return "/movie/popular"
        case .details(let id):
            return "/movie/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .nowPlaying, .topRated, .upComing, .latest, .popular, .details(_):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .nowPlaying, .topRated, .upComing, .latest, .popular:
            return .requestParameters(parameters: ["api_key": MovieNetworkManager.APIKEY], encoding: URLEncoding.queryString)
        case .details(let id):
            return .requestParameters(parameters: ["api_key":MovieNetworkManager.APIKEY, MovieNetworkManager.MOVIEID:id], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["contect-type":"application/json"]
    }
}
