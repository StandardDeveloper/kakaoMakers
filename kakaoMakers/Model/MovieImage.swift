//
//  MovieImage.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/26.
//

import Foundation

struct MovieImageList: Decodable {
    let backdrops: [MovieImage]
}

struct MovieImage: Decodable {

    var file_path: String
}
