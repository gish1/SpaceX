//
//  InformationRouter.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class InformationRouter: BaseModuleRouter, InformationRouterProtocol {
    func popModule() {
        coordinator.router.popModule(animated: true)
    }
}
