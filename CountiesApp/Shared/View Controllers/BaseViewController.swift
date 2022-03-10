//
//  BaseViewController.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import UIKit

class BaseViewController<P: Process>: UIViewController {
    
    private(set) var process: P!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startFlow() {
        process = .init()
    }
    
    func continueFlow(_ process: P) {
        self.process = process
    }
    
}
