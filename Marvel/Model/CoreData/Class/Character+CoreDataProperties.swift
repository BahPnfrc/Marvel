//
//  Character+CoreDataProperties.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 26/03/2022.
//
//

import Foundation
import CoreData


extension Character {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Character> {
        return NSFetchRequest<Character>(entityName: "Character")
    }

    @NSManaged public var name: String
    @NSManaged public var resourceURL: String?
    @NSManaged public var role: String?
    @NSManaged public var comics: NSOrderedSet?

}

// MARK: Generated accessors for comics
extension Character {

    @objc(insertObject:inComicsAtIndex:)
    @NSManaged public func insertIntoComics(_ value: Comic, at idx: Int)

    @objc(removeObjectFromComicsAtIndex:)
    @NSManaged public func removeFromComics(at idx: Int)

    @objc(insertComics:atIndexes:)
    @NSManaged public func insertIntoComics(_ values: [Comic], at indexes: NSIndexSet)

    @objc(removeComicsAtIndexes:)
    @NSManaged public func removeFromComics(at indexes: NSIndexSet)

    @objc(replaceObjectInComicsAtIndex:withObject:)
    @NSManaged public func replaceComics(at idx: Int, with value: Comic)

    @objc(replaceComicsAtIndexes:withComics:)
    @NSManaged public func replaceComics(at indexes: NSIndexSet, with values: [Comic])

    @objc(addComicsObject:)
    @NSManaged public func addToComics(_ value: Comic)

    @objc(removeComicsObject:)
    @NSManaged public func removeFromComics(_ value: Comic)

    @objc(addComics:)
    @NSManaged public func addToComics(_ values: NSOrderedSet)

    @objc(removeComics:)
    @NSManaged public func removeFromComics(_ values: NSOrderedSet)

}

extension Character : Identifiable {

}
