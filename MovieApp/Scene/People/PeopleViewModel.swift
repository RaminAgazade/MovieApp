//
//  PeopleViewModel.swift
//  MovieApp
//
//  Created by Ramin on 25.06.23.
//

import Foundation

class PeopleViewModel {
    
    var items = [PeopleResult]()
    
    var successCallback: (()->())?
    
    func getPopularPeople() {
        NetworkManager.shared.request(model: People.self,
                                      url: NetworkHelper.shared.urlConfig(path: "person/popular")) { people, errorMessage in
            if let errorMessage = errorMessage {
//                self.errorCallback?(errorMessage)
            } else if let people = people {
              self.items = people.result ?? []
                self.successCallback?()
            }
        }
    }
}
