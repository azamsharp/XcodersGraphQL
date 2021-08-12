//
//  ContinentListViewModel.swift
//  XcodersGraphQL
//
//  Created by Mohammad Azam on 8/11/21.
//

import Foundation
import Apollo

class ContinentListViewModel: ObservableObject {
    
    @Published var continents: [ContinentViewModel] = []
    
    func populateAllContinents() {
        
        // Get all continents 
    }
}

struct ContinentViewModel {
    
    let continent: GetAllContinentsQuery.Data.Continent
    
    var code: String {
        continent.code
    }
    
    var name: String {
        continent.name
    }
   
}
