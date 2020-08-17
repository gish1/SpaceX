//
//  ObjectsViewModel.swift
//
//  Created by Пк on 14.08.2020
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ObjectsViewModel: Codable {
    var mission_name: String
    var launch_year: String
    var details: String?
    var links: Links
}

struct Links: Codable {
    var mission_patch_small: String?
}
