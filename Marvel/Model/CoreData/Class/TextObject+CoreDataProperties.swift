//
//  TextObject+CoreDataProperties.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 26/03/2022.
//
//

import Foundation
import CoreData


extension TextObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TextObject> {
        return NSFetchRequest<TextObject>(entityName: "TextObject")
    }

    @NSManaged public var language: String?
    @NSManaged public var text: String?
    @NSManaged public var type: String?
    @NSManaged public var comic: Comic?

}

extension TextObject : Identifiable {

}
