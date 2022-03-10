//
//  AppDelegate.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router: Router!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        router = Router(window)
        
        return true
    }

}

