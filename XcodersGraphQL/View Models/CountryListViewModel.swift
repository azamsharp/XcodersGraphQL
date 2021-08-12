//
//  CountryListViewModel.swift
//  XcodersGraphQL
//
//  Created by Mohammad Azam on 8/9/21.
//

import Foundation
import Apollo


class CountryListViewModel: ObservableObject {
    
    @Published var countries: [CountryViewModel] = []
    
    func populateCountriesByContinent(code: String) {
        
        // Get all countries based on a continent
    }
    
}


struct CountryViewModel {
    
    let country: GetCountriesByContinentQuery.Data.Country
    
    var code: String {
        country.code 
    }
    
    var name: String {
        country.name
    }
    
    var emoji: String {
        country.emoji
    }
    
    var states: [StateViewModel] {
         country.states.map(StateViewModel.init)
    }
}

struct StateViewModel {
    
    let state: GetCountriesByContinentQuery.Data.Country.State
    
    var name: String {
        state.name
    }
    
} 
