//
//  ImageService.swift
//  SpaceX
//
//  Created by Пк on 17.08.2020.
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation
import UIKit

class ImageService {
    
    private init() {}
    static let shared = ImageService()
    
    func getImageData(string: String,completion: @escaping(NSData)-> Void) {
        guard let url = URL(string: string) else {
            return
        }
        var imageData : NSData?
        do {
            let data = try NSData(contentsOf: url, options: [])
            imageData = data
        }
        catch {
            print(error.localizedDescription)
        }
        if let data = imageData  {
            completion(data)
        }
    }
    
    func saveImage(image: NSData) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,  FileManager.SearchPathDomainMask.userDomainMask, true)
        let docs = paths[0] as NSString
        let uuid = NSUUID().uuidString + ".png"
        let fullPath = docs.appendingPathComponent(uuid)
        _ = image.write(toFile: fullPath, atomically: true)
        
        return uuid
    }
    
    func deleteAllImage() {
        DispatchQueue.global().async {
            let fileManager = FileManager.default
            let myDocuments = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            guard let filePaths = try? fileManager.contentsOfDirectory(at: myDocuments, includingPropertiesForKeys: nil, options: []) else { return }
            for filePath in filePaths {
                try? fileManager.removeItem(at: filePath)
            }
        }
    }
    
    func getImage(imageName: String) -> UIImage? {
        var savedImage: UIImage!
        
        if let imagePath = getFilePath(fileName: imageName) {
            savedImage = UIImage(contentsOfFile: imagePath)
        }
        return savedImage
    }
    
    func getFilePath(fileName: String) -> String? {
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        var filePath: String?

        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        
        if paths.count > 0 {
            let dirPath = paths[0] as NSString
            filePath = dirPath.appendingPathComponent(fileName)
        } else {
            filePath = nil
        }
        
        return filePath
    }
}
