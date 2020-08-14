//
//  MainCoordinator.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

class MainCoordinator: BaseCoordinator, MainCoordinatorType {
    
    override func start() {
        let module = container.resolve(ObjectsListAssembly.self).build(coordinator: self)
        router.setRootModule(module)
    }
    
    override func toPresent() -> UIViewController {
        return router.rootViewController!
    }
}
