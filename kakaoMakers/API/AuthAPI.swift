//
//  AuthAPI.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/10.
//

import Foundation
import Moya

enum AuthAPI {
    
    case signup(name: String, email: String, password: String)
    case login(email: String, password: String)
    case activation(token: String)
    case forgotpassword(email: String)
    case resetpassword(resetPasswordLink: String, newPassword: String)
    case current(token: String)
    case facebookLogin(token: String)

}

extension AuthAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "http://localhost:3000/users") else { fatalError("url error") }
        return url
    }
    
    var path: String {
        switch self {
        case .signup(_, _, _):
            return "/signup"
        case .login(_, _):
            return "/login"
        case .activation(_):
            return "/activation"
        case .forgotpassword(_):
            return "/forgotpassword"
        case .resetpassword(_, _):
            return "/resetpassword"
        case .current(_):
            return "/secret"
        case .facebookLogin(_):
            return "/facebook"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signup(_, _, _), .login(_, _), .activation(_):
            return .post
        case .forgotpassword(_), .resetpassword(_, _):
            return .put
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .signup(let name, let email, let password):
            return .requestParameters(parameters: ["name": name, "email": email, "password": password], encoding: JSONEncoding.default)
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .activation(let token):
            return .requestParameters(parameters: ["token" : token], encoding: JSONEncoding.default)
        case .forgotpassword(let email):
            return .requestParameters(parameters: ["email" : email], encoding: JSONEncoding.default)
        case .resetpassword(let resetPasswordLink, let newPassword):
            return .requestParameters(parameters: ["resetPasswordLink" : resetPasswordLink, "newPassword" : newPassword], encoding: JSONEncoding.default)
        case .current(_):
            return .requestPlain
        case .facebookLogin(let token):
            return .requestParameters(parameters: ["access_token" : token], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .current(let token):
            return ["Authorization": "Bearer \(token)"]
        default:
            return ["Content-Type": "application/json"]
        }
    }
}
