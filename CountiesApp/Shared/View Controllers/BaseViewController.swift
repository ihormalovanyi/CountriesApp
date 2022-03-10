//
//  BaseViewController.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import UIKit

class BaseViewController<P: Process>: UIViewController {
    
    private(set) var process: P = .init()
    
}
