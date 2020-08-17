//
//  AppDelegate.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: AppDelegateManager {
    var window: UIWindow?
    
    lazy var container: DependencyContainer = {
        let factory = AssemblyFactory()
        let container = DependencyContainer(assemblyFactory: factory)
        
        // Setup Coordinators
        container.apply(AppCoordinatorAssembly.self)
        container.apply(MainCoordinatorAssembly.self)
        
        // Setup Modules
        container.apply(InformationAssembly.self)
        container.apply(ObjectsListAssembly.self)
        
        // Setup Services
        container.apply(AppConfigServiceAssembly.self)
        container.apply(EnvironmentServiceAssembly.self)
        
        return container
    }()
    
    override var services: [AppDelegateService] {
        return [
            ApplicationService(container: container, window: window)
        ]
    }
}

