//
//  ComicDate+CoreDataProperties.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 26/03/2022.
//
//

import Foundation
import CoreData


extension ComicDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ComicDate> {
        return NSFetchRequest<ComicDate>(entityName: "ComicDate")
    }

    @NSManaged public var date: Date?
    @NSManaged public var type: String?
    @NSManaged public var comic: Comic?

}

extension ComicDate : Identifiable {

}
