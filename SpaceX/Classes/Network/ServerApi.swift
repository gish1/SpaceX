//
//  ServerApi.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class ServerApi {
        
    private init() {}
    static let shared = ServerApi()
    
    func request(urlString: String, completeion: @escaping (Result<Data, Error>)-> Void) {
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completeion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
            }
                completeion(.success(data))
        }.resume()
    }
}

 
