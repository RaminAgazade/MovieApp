//
//  HomeManager.swift
//  MovieApp
//
//  Created by Ramin on 26.06.23.
//

import Foundation

class HomeManager {
    static let shared = HomeManager()
    
    func getItems(complete: @escaping((Movie?, String?)->()))  {
        
        NetworkManager.shared.request(model: Movie.self,
                                      url: "",
                                      complete: complete)
    }
}
