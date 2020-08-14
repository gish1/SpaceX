//
//  Error+Ext.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020.
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

extension Error {
    
    var code: Int {
        return (self as NSError).code
    }
    
    var domain: String {
        return (self as NSError).domain
    }
}
