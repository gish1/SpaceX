//
//  ObjectsListInteractor.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class ObjectsListInteractor: ObjectsListInteractorInput {
    
    let persistence = PersistenceService.shared
    let imageManager = ImageService.shared
    let network = ServerApi.shared
    
    func obtainInformation() {
        network.request(urlString: Constants.Network.url.rawValue) { result in
            switch result {
            case .success(let data):
                self.imageManager.deleteAllImage()
                self.persistence.deleteData(Launch.self)
                do {
                    let models = try JSONDecoder().decode([ObjectsViewModel].self, from: data)
                    self.getLaunches(json: models)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getLaunches(json: [ObjectsViewModel]) {
        for object in json {
            let launch = Launch(context: persistence.context)
            launch.name = object.mission_name
            launch.launchYear = object.launch_year
            launch.details = object.details
            
            DispatchQueue.global().async {
                self.imageManager.getImageData(string: object.links.mission_patch_small ?? "") { (data) in
                    DispatchQueue.main.async {
                        launch.imagePath = self.imageManager.saveImage(image: data)
                    }
                }
            }
        }
    }
}

// MARK: Private
extension ObjectsListInteractor {
    
}
