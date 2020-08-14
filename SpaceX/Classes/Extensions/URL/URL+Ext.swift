//
//  URL+Ext.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

extension URL {
    func fileSize() -> Int64 {
        if let resourceValuess = try? (self as NSURL).resourceValues(forKeys: [URLResourceKey.fileSizeKey]) {
            let size = resourceValuess[URLResourceKey.fileSizeKey]
            return size as? Int64 ?? 0
        } else {
            return 0
        }
    }
}
