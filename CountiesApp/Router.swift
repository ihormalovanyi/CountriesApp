//
//  Router.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import Foundation
import UIKit

class Router {
    
    var navigationController: UINavigationController!
    
    init(_ window: UIWindow?) {
        let initialVC = createCountrySearchFlow()
        navigationController = UINavigationController(rootViewController: initialVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func createCountrySearchFlow() -> CountrySearchViewController {
        CountrySearchViewController()
    }
    
}
