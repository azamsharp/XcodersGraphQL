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
        
        Network.shared.apollo.fetch(query: GetCountriesByContinentQuery(code: code)) { [weak self] result in
            switch result {
                case .success(let graphQLResult):
                    if let countries = graphQLResult.data?.countries {
                        self?.countries = countries.map(CountryViewModel.init)
                    }
                case .failure(let error):
                    print(error)
            }
        }
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
