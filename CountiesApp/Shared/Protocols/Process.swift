//
//  Process.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import Foundation
import UIKit

protocol Process {
    
    init()
    
}

extension Process {
    
    var router: Router? {
        (UIApplication.shared.delegate as? AppDelegate)?.router
    }
    
}
