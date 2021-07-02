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
            
            ProgressHUD.show()
            
            switch results {
            case.success(let response):
                do {
                    let movieListJson = try? JSONDecoder().decode(MovieList.self, from: response.data)
                    if let movieList = movieListJson {
                        completion(movieList.results)
                        ProgressHUD.dismiss()
                    }
                    
                }
                catch let err {
                    print(err)
                    ProgressHUD.dismiss()
                }
                
            case.failure(let err):
                print(err)
                ProgressHUD.dismiss()
                break
                
            }
        }
    }
    
    func getDetailMovie(movieID: Int, completion: @escaping(DetailMovie) -> ()) {
        
        provider.request(.details(id: movieID)) { (results) in
            
            switch results {
            
            case.success(let response):
                
                do{
                    let detailMovieJson = try? JSONDecoder().decode(DetailMovie.self, from: response.data)
                    
                    if let detailMovie = detailMovieJson {
                        completion(detailMovie)
                        ProgressHUD.dismiss()
                    }
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
    
    func getMovieImages(movieID: Int, completion: @escaping ([MovieImage]) -> ()) {
        
        provider.request(.image(id: movieID)) { (results) in
            
            ProgressHUD.show()
            
            switch results {
            case.success(let response):
                do {
                    let movieImageListJson = try? JSONDecoder().decode(MovieImageList.self, from: response.data)
                    //print("dddd", movieImageListJson!)
                    completion(movieImageListJson!.backdrops)
                    ProgressHUD.dismiss()
                    
                }
                catch let err {
                    print(err)
                    ProgressHUD.dismiss()
                }
                
            case.failure(let err):
                print(err)
                ProgressHUD.dismiss()
                break
                
            }
        }
    }
    
    
    
//    func getDetailMovie(movieID: Int, completion: @escaping(DetailMovie) -> ()) {
//
//        provider.request(.details(id: movieID)) { (results) in
//
//            switch results {
//
//            case.success(let response):
//
//                do{
//                    let result: DetailMovie = try JSONDecoder().decode(DetailMovie.self, from: response.data)
//                    ProgressHUD.dismiss()
//                    completion(result)
//
//                    print(movieID)
//                }
//                catch let err{
//                    ProgressHUD.dismiss()
//                    print(err)
//                }
//
//            case.failure(let err):
//                ProgressHUD.dismiss()
//                print(err)
//                break
//            }
//        }
//    }
}
