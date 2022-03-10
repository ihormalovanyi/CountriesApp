//
//  CountrySearchProcess.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import Foundation

class CountrySearchProcess: Process {
    
    //MARK: State
    private(set) var searchedCountries: [CountryModelRaw.Displayable] = []
    private(set) var selectedCountry: CountryModelRaw.Displayable?
    
    //MARK: Properties
    private var network: CountrySearchNetwork
    private var timer: Timer?
    
    //MARK: Lifecycle
    required init() {
        network = CountrySearchNetwork()
    }
    
    //MARK: Functions
    func searchCountries(by text: String, completion: @escaping () -> ()) {
        timer?.invalidate()
        
        if text.isEmpty {
            searchedCountries = []
            completion()
            
            return
        }
        
        timer = .scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
            self?.network.searchCountries(text) { models in
                self?.searchedCountries = models.compactMap { $0.displayable }
                completion()
            }
        })
    }
    
    func selectCountry(at index: Int) {
        selectedCountry = searchedCountries[index]
        router?.showCountryDetails(in: self)
    }
    
}
