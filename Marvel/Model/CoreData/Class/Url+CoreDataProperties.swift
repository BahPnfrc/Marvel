//
//  Url+CoreDataProperties.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 26/03/2022.
//
//

import Foundation
import CoreData


extension Url {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Url> {
        return NSFetchRequest<Url>(entityName: "Url")
    }

    @NSManaged public var type: String?
    @NSManaged public var url: String?
    @NSManaged public var comic: Comic?

}

extension Url : Identifiable {

}
