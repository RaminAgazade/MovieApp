//
//  HomeManager.swift
//  MovieApp
//
//  Created by Ramin on 26.06.23.
//

import Foundation

class HomeManager {
    static let shared = HomeManager()
    
    func getIMovietems(category: HomeCategory, complete: @escaping((Movie?, String?)->()))  {
        var url = ""
        switch category {
        case .popular:
            url = HomeEndpoint.popular.path
        case .topRated:
            url = HomeEndpoint.topRated.path
        }
        NetworkManager.shared.request(model: Movie.self,
                                      url: url,
                                      complete: complete)
    }
}
