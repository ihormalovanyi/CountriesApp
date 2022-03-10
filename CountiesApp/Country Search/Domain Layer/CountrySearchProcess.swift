//
//  CountrySearchProcess.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import Foundation

class CountrySearchProcess: Process {
    
    //MARK: State
    private(set) var searchedCountries: [CountryModelRaw] = []
    private var fullNameSearch: Bool = false
    
    //MARK: Properties
    private var network: CountrySearchNetwork
    
    //MARK: Lifecycle
    required init() {
        network = CountrySearchNetwork()
    }
    
    //MARK: Functions
    func searchCountries(by text: String) throws {
        try network.searchCountries(text) { [weak self] models in
            self?.searchedCountries = models
        }
    }
    
    func fullNameSearch(_ value: Bool) {
        self.fullNameSearch = value
    }
    
}
