//
//  CountrySearchProcess.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import Foundation

class CountrySearchProcess: Process {
    
    //MARK: Active State
    private(set) var searchedCountries: [CountryModelRaw.Displayable] = [] {
        didSet {
            onStateChanged?()
        }
    }
    private(set) var isLoading: Bool = false {
        didSet {
            onStateChanged?()
        }
    }
    private(set) var isSearchTextEmpty = true {
        didSet {
            onStateChanged?()
        }
    }
    
    //MARK: Passive State
    private(set) var selectedCountry: CountryModelRaw.Displayable?
    
    //MARK: Properties
    private var network: CountrySearchNetwork
    private var timer: Timer?
    
    //Possible to replace with delegate or listeners (when view controller subscribes on process)
    var onStateChanged: (() -> ())?
    
    //MARK: Lifecycle
    required init() {
        network = CountrySearchNetwork()
    }
    
    //MARK: Functions
    func searchCountries(by text: String) {
        timer?.invalidate()
        isLoading = false
        
        if text.isEmpty {
            searchedCountries = []
            isSearchTextEmpty = true
            
            return
        }
        
        isSearchTextEmpty = false
        
        isLoading = true
        timer = .scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
            self?.network.searchCountries(text) { result in
                switch result {
                case .result(let models):
                    self?.searchedCountries = models.compactMap { $0.displayable }
                case .error:
                    self?.searchedCountries = []
                }
                
                self?.isLoading = false
            }
        })
    }
    
    func selectCountry(at index: Int) {
        guard !searchedCountries.isEmpty else { return }
        
        selectedCountry = searchedCountries[index]
        router?.showCountryDetails(in: self)
    }
    
}
