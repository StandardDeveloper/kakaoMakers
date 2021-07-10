//
//  AuthNetworkManager.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/10.
//

import Foundation
import Moya
import SwiftyJSON

protocol AuthNetwork {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

struct AuthNetworkManager: AuthNetwork {
    
    let provider = MoyaProvider<AuthAPI>()
    
    func getProfile(token: String, completion: @escaping(ProfileData) -> ()) {
        
        provider.request(.current(token: token)) { results in
            
            switch results {
            
            case .success(let res):
                do {
                    let results: ProfileData = try JSONDecoder().decode(ProfileData.self, from: res.data)
                    completion(results)
                }
                catch let err {
                    print(err)
                }
                
            case .failure(let err):
                print(err)
            
            }
        }
    }
}
