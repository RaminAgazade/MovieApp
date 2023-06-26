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
    
    var successCallback: (()->())?
    
    func getpopularMovies() {
        NetworkManager.shared.request(model: Movie.self,
                                      url: NetworkHelper.shared.urlConfig(path: "movie/top_rated")) { movieData, error in
            if let error = error {
                print("")
            } else if let movieData = movieData {
                self.category.append(Category(title: "Popular",
                                              items: movieData.results ?? []))
                self.successCallback?()
                
            }
        }
    }
    
    func getTopRatedMovies() {
        NetworkManager.shared.request(model: Movie.self,
                                      url: NetworkHelper.shared.urlConfig(path: "movie/popular")) { movieData, error in
            if let error = error {
                print("")
            } else if let movieData = movieData {
                self.category.append(Category(title: "Top Rated",
                                              items: movieData.results ?? []))
                self.successCallback?()
                

            }
        }
    }
    
    func getTopRatedItems() {
        NetworkManager.shared.request(model: Movie.self,
                                      url: NetworkHelper.shared.urlConfig(path: "movie/top_rated")) { movieData, errorMessage in
            if let errorMessage = errorMessage {
//                self.errorCallback?(errorMessage)
            } else if let movieData = movieData {
//                self.items = movieData.results ?? []
                self.category.append(Category(title: "Top Rated", items: movieData.results ?? []))
                self.successCallback?()
            }
        }
    }
}

