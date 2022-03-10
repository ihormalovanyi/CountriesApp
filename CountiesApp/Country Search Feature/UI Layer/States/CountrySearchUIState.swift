//
//  CountrySearchUIState.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import Foundation

struct CountrySearchUIState {
    
    var searchedCountries: [CountryModelRaw.Displayable]
    var isLoading: Bool = false
    var isSearchTextEmpty = true
 
    var serviceMessage: String {
        isSearchTextEmpty ? "Start typing to search" : "Nothing found"
    }
    
}
