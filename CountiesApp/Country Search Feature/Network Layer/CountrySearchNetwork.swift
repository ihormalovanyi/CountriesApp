//
//  NetworkService.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import Foundation
import UIKit

final class CountrySearchNetwork {
    
    struct Constants {
        
        static let searchByNameURL = "https://restcountries.com/v3.1/name/"
        
    }
    
    private var networkService = NetworkService()
    private var activeTask: URLSessionDataTask?
    
    func searchCountries(_ text: String, completion: @escaping ([CountryModelRaw]) -> ()) {
        activeTask?.cancel()
        activeTask = nil
        
        let stringURL = Constants.searchByNameURL + text
        activeTask = try? networkService.dataTask(for: stringURL, completion: completion)
        activeTask?.resume()
    }
    
}

