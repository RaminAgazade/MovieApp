//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Ramin on 20.06.23.
//

import Foundation

struct Category {
    let title: String
    let items: [MovieResult]
}

class HomeViewModel {
//    var movie: Movie?
    var category = [Category]()
    
    var errorCallback: ((String)->())?
    var successCallback: (()->())?
    
    func getItems() {
        getMovieItems(category: .popular)
        getMovieItems(category: .topRated)
    }
    
  private  func getMovieItems(category: HomeCategory) {
        HomeManager.shared.getIMovietems(category: category) { movieData, error in
            if let error = error {
                self.errorCallback?(error)
            } else if let movieData = movieData {
                self.category.append(Category(title: category.rawValue,
                                              items: movieData.results ?? []))
                self.successCallback?()
                
            }
        }
    }
}

