//
//  InformationContracts.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

// Module Input
protocol InformationModuleInput {
    
}

// Module Output
protocol InformationModuleOutput {
    
}

// View Input
protocol InformationViewInput: class {
    func set(title: String)
}

// View Output
protocol InformationViewOutput: class {
    func viewDidLoad()
}

// Interactor
protocol InformationInteractorInput {
}

// Router
protocol InformationRouterProtocol: AlertRoutable {
    
}
