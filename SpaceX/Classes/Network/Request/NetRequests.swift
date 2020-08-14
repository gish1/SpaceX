//
//  NetRequests.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

protocol RequstModelSerealizable {
    func parameters() -> [String: Any]
    func body() -> Data
}

extension RequstModelSerealizable {
    func parameters() -> [String: Any] { return [:] }
    func body() -> Data { return Data() }
}
