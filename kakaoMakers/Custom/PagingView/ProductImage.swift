//
//  ProductImage.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/26.
//

import Foundation
import UIKit

class ProductImage
{
    var movieIndex: Int = 508943
    var networkProvider = MovieNetworkManager()
    var movieImages = [MovieImage]()
    var images: [UIImage]?
    
    func getImageData() {
        
        networkProvider.getMovieImages(movieID: movieIndex) { results in
            
            self.movieImages = results
            print("_______________", self.movieImages)
        }
    }
 
    init(images: [UIImage]?)
    {
        self.images = images
    }
    
    class func fetchProducts() -> [ProductImage]
    {
        var images = [ProductImage]()
        
        
        var shoe1Images = [UIImage]()
        for i in 1...8 {
            shoe1Images.append(UIImage(named: "s\(i)")!)
        }
        return images
    }
}

