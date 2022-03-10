//
//  Router.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import Foundation
import UIKit

class Router {
    
    private var navigationController: UINavigationController!
    
    init(_ window: UIWindow?) {
        let initialVC = createCountrySearchFlow()
        
        navigationController = UINavigationController(rootViewController: initialVC)
        navigationController.navigationBar.prefersLargeTitles = true
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func createCountrySearchFlow() -> CountrySearchViewController {
        let viewController = CountrySearchViewController()
        viewController.startFlow()
        
        return viewController
    }
    
    func showCountryDetails(in process: CountrySearchProcess) {
        let viewController = CountryDetailsViewController()
        viewController.continueFlow(process)
        
        navigationController.showDetailViewController(viewController, sender: nil)
    }
    
}
