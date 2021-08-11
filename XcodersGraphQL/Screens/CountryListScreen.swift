//
//  CountryListScreen.swift
//  XcodersGraphQL
//
//  Created by Mohammad Azam on 8/11/21.
//

import SwiftUI

struct CountryListScreen: View {
    
    @StateObject var countryListVM = CountryListViewModel()
    let continent: ContinentViewModel
    
    var body: some View {
        List(countryListVM.countries, id: \.code) { country in
            VStack(alignment: .leading) {
                HStack {
                    Text(country.emoji)
                    Text(country.name)
                }
                ForEach(country.states, id: \.name) { state in
                    Text(state.name)
                }
            }
        }.onAppear(perform: {
            countryListVM.populateCountriesByContinent(code: continent.code)
        })
        .navigationTitle(continent.name)
    }
}

struct CountryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        let continentVM = ContinentViewModel(continent: GetAllContinentsQuery.Data.Continent(name: "Africa", code: "AF"))
        CountryListScreen(continent: continentVM)
    }
}
