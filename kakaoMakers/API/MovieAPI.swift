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
    case toRated
    case upComing
    case details(id: Int)
    case images(id: Int)
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
        case .toRated:
            return "/movie/top_rated"
        case .upComing:
            return "/movie/upcoming"
        case .details(let id):
            return "/movie/\(id)"
        case .images(let id):
            return "/movie/\(id)/images"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .nowPlaying, .toRated, .upComing, .details(_), .images(_):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .nowPlaying, .toRated, .upComing:
            return .requestParameters(parameters: ["api_key": MovieNetworkManager.APIKEY], encoding: URLEncoding.queryString)
        case .details(let id):
            return .requestParameters(parameters: ["api_key":MovieNetworkManager.APIKEY, MovieNetworkManager.MOVIEID:id], encoding: URLEncoding.queryString)
        case .images(let id):
            return .requestParameters(parameters: ["api_key":MovieNetworkManager.APIKEY], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["contect-type":"application/json"]
    }
}
