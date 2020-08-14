//
//  ObjectsListViewController.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

class ObjectsListViewController: UIViewController, ObjectsListViewInput {
    var output: ObjectsListViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
}

// MARK: - Configure
extension ObjectsListViewController {
    
}

// MARK: View Input
extension ObjectsListViewController {
    func set(title: String) {
        self.title = title
    }
}

// MARK: Button Action
extension ObjectsListViewController {
    
}
