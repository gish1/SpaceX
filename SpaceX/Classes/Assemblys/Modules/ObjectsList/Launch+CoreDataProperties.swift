//
//  Launch+CoreDataProperties.swift
//  
//
//  Created by Пк on 16.08.2020.
//
//

import Foundation
import CoreData


extension Launch {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Launch> {
        return NSFetchRequest<Launch>(entityName: "Launch")
    }

    @NSManaged public var details: String?
    @NSManaged public var imagePath: String?
    @NSManaged public var launchYear: String?
    @NSManaged public var name: String?

}
