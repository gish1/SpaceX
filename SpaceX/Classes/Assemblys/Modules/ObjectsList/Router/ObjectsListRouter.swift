//
//  ObjectsListRouter.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class ObjectsListRouter: BaseModuleRouter, ObjectsListRouterProtocol {
    func showInformation(model: Launch) {
        let module = container.resolve(InformationAssembly.self).build(coordinator: coordinator)
        coordinator.router.push(module)
        module.input.setDetailObject(model: model)
        
    }
}
