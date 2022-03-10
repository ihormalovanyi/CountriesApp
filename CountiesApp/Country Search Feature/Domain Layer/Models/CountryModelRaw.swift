//
//  CountryModel.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import Foundation

struct CountryModelRaw: Decodable {
    
    var name: Name
    var currencies: [String : Currency]?
    var capital: [String]?
    var region: String?
    var languages: [String : String]?
    var latlng: [Double]?
    var borders: [String]?
    var area: Double?
    var flag: String?
    var population: Int?
    var timezones: [String]?
    var flags: PNGImage?
    var coatOfArms: PNGImage?
    
    var displayable: Displayable { .init(self) }
    
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
    
    struct Displayable {
        
        var title: String
        var shortTitle: String
        var shortTitleWithFlag: String
        var region: String
        
        var flagImageLink: String
        var coatOfArmsImageLink: String
        
        var summary: [(title: String, info: String)]
        
        init(_ raw: CountryModelRaw) {
            title = raw.name.official ?? raw.name.common ?? ""
            shortTitle = raw.name.common ?? title
            shortTitleWithFlag = shortTitle
            if let flag = raw.flag {
                shortTitleWithFlag = "\(flag) \(shortTitle)"
            }
            region = raw.region ?? "Unknowned"
            
            flagImageLink = raw.flags?.png ?? ""
            coatOfArmsImageLink = raw.coatOfArms?.png ?? ""
            
            summary = []
            if let currencies = raw.currencies?
                .compactMap({ $0.value.name })
                .sorted() {
                summary.append(("Currencies", currencies.joined(separator: ", ")))
            }
            if let capital = raw.capital?.first {
                summary.append(("Capital", capital))
            }
            if let languages = raw.languages?
                .compactMap({ $0.value })
                .sorted() {
                summary.append(("Languages", languages.joined(separator: ", ")))
            }
            if let lat = raw.latlng?.first,
               let long = raw.latlng?.last {
                summary.append(("Coordinates", "\(lat), \(long)"))
            }
            if let borders = raw.borders {
                summary.append(("Borders", "\(borders.count)"))
            }
            if let area = raw.area {
                summary.append(("Area", "\(area)m²"))
            }
            if let population = raw.population {
                summary.append(("Population", "\(population)"))
            }
            if let timezones = raw.timezones {
                summary.append(("Timezones", timezones.joined(separator: ", ")))
            }
        }
        
    }
    
}
