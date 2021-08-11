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
        
        Network.shared.apollo.fetch(query: GetAllContinentsQuery()) { [weak self] result in
            switch result {
                case .success(let graphQLResult):
                    DispatchQueue.main.async {
                        if let continents = graphQLResult.data?.continents {
                            self?.continents = continents.map(ContinentViewModel.init)
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
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
