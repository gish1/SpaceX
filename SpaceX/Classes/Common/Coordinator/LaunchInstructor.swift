//
//  LaunchInstructor.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

enum LaunchInstructor {
    case main
    case auth
    case onboarding
    
    static func configure(tutorialWasShown: Bool, isAutorized: Bool) -> LaunchInstructor {
        switch (tutorialWasShown, isAutorized) {
        case (true, false), (false, false): return .auth
        case (false, true): return .onboarding
        case (true, true): return .main
        }
    }
}
