//
//  ObjectsListPresenter.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class ObjectsListPresenter: BasePresenter<ObjectsListInteractorInput, ObjectsListRouterProtocol>, ObjectsListModuleOutput {
    
    // MARK: - Weak properties
    weak var view: ObjectsListViewInput?
}

// MARK: Private
extension ObjectsListPresenter {
    
}

// MARK: Module Input
extension ObjectsListPresenter: ObjectsListModuleInput {
    
}

// MARK: View Output
extension ObjectsListPresenter: ObjectsListViewOutput {
    func viewDidLoad() {
        view?.set(title: "ObjectsList")
    }
}
