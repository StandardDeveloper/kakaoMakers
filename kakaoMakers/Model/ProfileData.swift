//
//  ProfileData.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/07/10.
//

import Foundation

struct ProfileData {
    var name: String
    var email: String
    var avatar: String
}

extension ProfileData: Codable {
    
    enum ProfileDataCodingkeys: String, CodingKey {
        case name
        case email
        case avatar
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ProfileDataCodingkeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        email = try container.decode(String.self, forKey: .email)
        avatar = try container.decode(String.self, forKey: .avatar)
    }
}
