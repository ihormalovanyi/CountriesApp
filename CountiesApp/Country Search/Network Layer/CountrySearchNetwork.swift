//
//  NetworkService.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import Foundation

final class CountrySearchNetwork {
    
    struct Constants {
        
        static let searchByNameURL = "https://restcountries.com/v3.1/name/"
        static let fullNameSearchParam = "fullText"
        
    }
    
    private var networkService = NetworkService()
    private var activeTask: URLSessionDataTask?
    
    func searchCountries(_ text: String, fullName: Bool = false, completion: @escaping ([CountryModelRaw]) -> ()) throws {
        activeTask?.cancel()
        activeTask = nil
        
        let stringURL = Constants.searchByNameURL + text + (fullName ? "?\(Constants.fullNameSearchParam)=true" : "")
        activeTask = try networkService.dataTask(for: stringURL, completion: completion)
        activeTask?.resume()
    }
    
}
