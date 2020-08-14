//
//  ObjectsListContracts.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

// Module Input
protocol ObjectsListModuleInput {
    
}

// Module Output
protocol ObjectsListModuleOutput {
    
}

// View Input
protocol ObjectsListViewInput: class {
    func set(title: String)
}

// View Output
protocol ObjectsListViewOutput: class {
    func viewDidLoad()
}

// Interactor
protocol ObjectsListInteractorInput {
}

// Router
protocol ObjectsListRouterProtocol: AlertRoutable {
    
}
