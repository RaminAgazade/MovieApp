//
//  HomeHelper.swift
//  MovieApp
//
//  Created by Ramin on 26.06.23.
//

import Foundation

enum HomeCategory: String {
    case popular = "Popular"
    case topRated = "Top Rated"
}


enum HomeEndpoint: String {
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    
    var path: String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
        
    }
}
