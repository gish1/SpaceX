//
//  InformationPresenter.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class InformationPresenter: BasePresenter<InformationInteractorInput, InformationRouterProtocol>, InformationModuleOutput {
    
    // MARK: - Weak properties
    weak var view: InformationViewInput?
}

// MARK: Private
extension InformationPresenter {
    
}

// MARK: Module Input
extension InformationPresenter: InformationModuleInput {
    
}

// MARK: View Output
extension InformationPresenter: InformationViewOutput {
    func viewDidLoad() {
        view?.set(title: "Information")
    }
}
