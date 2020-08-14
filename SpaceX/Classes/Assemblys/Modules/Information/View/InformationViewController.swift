//
//  InformationViewController.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController, InformationViewInput {
    var output: InformationViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
}

// MARK: - Configure
extension InformationViewController {
    
}

// MARK: View Input
extension InformationViewController {
    func set(title: String) {
        self.title = title
    }
}

// MARK: Button Action
extension InformationViewController {
    
}
