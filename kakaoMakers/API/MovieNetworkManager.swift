//
//  MovieNetworkManager.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/16.
//

import Foundation
import Moya
import ProgressHUD

protocol MovieNetwork {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

struct MovieNetworkManager: MovieNetwork {
    
    static let MAINURL = "https://api.themoviedb.org/3"
    static let APIKEY = "4eb8bd52ee80a1bd0fe09cbc16a219d6"
    static let MOVIEID = "movie_id"
    
    let provider = MoyaProvider<MovieAPI>()
    
    func getMovies(target: MovieAPI, completion: @escaping ([Movie]) -> ()) {
        
        provider.request(target) { (results) in
            
            switch results {
            case.success(let response):
                do {
                    
                    let movieListJson = try? JSONDecoder().decode(MovieList.self, from: response.data)
                    if let movieList = movieListJson {
                        completion(movieList.results)
                    }
                    
                }
                catch let err {
                    print(err)
                }
                
            case.failure(let err):
                print(err)
                break
                
            }
        }
    }
    
    func getDetailMovie(movieID: Int, completion: @escaping(DetailMovie) -> ()) {
        
        ProgressHUD.show()
        
        provider.request(.details(id: movieID)) { (results) in
            
            switch results {
            
            case.success(let response):
                
                do{
                    let result: DetailMovie = try JSONDecoder().decode(DetailMovie.self, from: response.data)
                    ProgressHUD.dismiss()
                    completion(result)
                    
                    print(movieID)
                }
                catch let err{
                    ProgressHUD.dismiss()
                    print(err)
                }
                
            case.failure(let err):
                ProgressHUD.dismiss()
                print(err)
                break
            }
        }
        
    }
    
}
