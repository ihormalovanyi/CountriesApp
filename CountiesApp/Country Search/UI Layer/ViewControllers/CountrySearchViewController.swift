//
//  CountrySearchViewController.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import UIKit

final class CountrySearchViewController: BaseViewController<CountrySearchProcess> {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        try? process.searchCountries(by: "tan")
    }
    
    private func setupSearch() {
        
    }


}

