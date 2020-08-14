//
//  InformationAssembly.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

typealias InformationModule = Module<InformationModuleInput, InformationModuleOutput>

class InformationAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> InformationModule {
        // View
        let view = InformationViewController.controllerFromStoryboard("Information")
        
        // Interactor
        let interactor = InformationInteractor()
        
        // Router
        let router = InformationRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = InformationPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
