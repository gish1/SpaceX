//
//  ObjectsListAssembly.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

typealias ObjectsListModule = Module<ObjectsListModuleInput, ObjectsListModuleOutput>

class ObjectsListAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> ObjectsListModule {
        // View
        let view = ObjectsListViewController.controllerFromStoryboard("ObjectsList")
        
        // Interactor
        let interactor = ObjectsListInteractor()
        
        // Router
        let router = ObjectsListRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = ObjectsListPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
