//
//  CountryModel.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import Foundation

struct CountryModelRaw: Decodable {
    
    var name: Name
    var independent: Bool?
    var currencies: [String : Currency]?
    var capital: [String]?
    var region: String?
    var subregion: String?
    var languages: [String : String]?
    var latlng: [Double]?
    var borders: [String]?
    var area: Double?
    var flag: String?
    var population: Int?
    var timezones: [String]?
    var continents: [String]?
    var flags: PNGImage?
    var coatOfArms: PNGImage?
    
    struct Name: Decodable {
        
        var common: String?
        var official: String?
        
    }
    
    struct Currency: Decodable {
        
        var name: String?
        var symbol: String?
        
    }
    
    struct PNGImage: Decodable {
        
        var png: String?
        
    }
    
}
