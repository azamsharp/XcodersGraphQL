//
//  ContinentListScreen.swift
//  XcodersGraphQL
//
//  Created by Mohammad Azam on 8/11/21.
//

import SwiftUI

struct ContinentListScreen: View {
    
    @StateObject private var continentListVM = ContinentListViewModel()
    
    var body: some View {
        NavigationView {
            List(continentListVM.continents, id: \.code) { continent in
                
                NavigationLink(
                    destination: CountryListScreen(continent: continent),
                    label: {
                        Text(continent.name)
                    })
                
            }.onAppear(perform: {
                continentListVM.populateAllContinents()
            })
            .navigationTitle("Continents")
        }
    }
}

struct ContinentListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContinentListScreen()
    }
}
