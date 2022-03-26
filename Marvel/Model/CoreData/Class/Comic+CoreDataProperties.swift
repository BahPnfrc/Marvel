//
//  Comic+CoreDataProperties.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 26/03/2022.
//
//

import Foundation
import CoreData


extension Comic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comic> {
        return NSFetchRequest<Comic>(entityName: "Comic")
    }

    @NSManaged public var format: String?
    @NSManaged public var id: Int64
    @NSManaged public var isFavorite: Bool
    @NSManaged public var modified: Date?
    @NSManaged public var pageCount: Int64
    @NSManaged public var thumbnail: Data?
    @NSManaged public var timeStamp: Date?
    @NSManaged public var title: String?
    @NSManaged public var characters: NSOrderedSet?
    @NSManaged public var comicDates: NSOrderedSet?
    @NSManaged public var creators: NSOrderedSet?
    @NSManaged public var textObjects: NSOrderedSet?
    @NSManaged public var urls: NSOrderedSet?

}

// MARK: Generated accessors for characters
extension Comic {

    @objc(insertObject:inCharactersAtIndex:)
    @NSManaged public func insertIntoCharacters(_ value: Character, at idx: Int)

    @objc(removeObjectFromCharactersAtIndex:)
    @NSManaged public func removeFromCharacters(at idx: Int)

    @objc(insertCharacters:atIndexes:)
    @NSManaged public func insertIntoCharacters(_ values: [Character], at indexes: NSIndexSet)

    @objc(removeCharactersAtIndexes:)
    @NSManaged public func removeFromCharacters(at indexes: NSIndexSet)

    @objc(replaceObjectInCharactersAtIndex:withObject:)
    @NSManaged public func replaceCharacters(at idx: Int, with value: Character)

    @objc(replaceCharactersAtIndexes:withCharacters:)
    @NSManaged public func replaceCharacters(at indexes: NSIndexSet, with values: [Character])

    @objc(addCharactersObject:)
    @NSManaged public func addToCharacters(_ value: Character)

    @objc(removeCharactersObject:)
    @NSManaged public func removeFromCharacters(_ value: Character)

    @objc(addCharacters:)
    @NSManaged public func addToCharacters(_ values: NSOrderedSet)

    @objc(removeCharacters:)
    @NSManaged public func removeFromCharacters(_ values: NSOrderedSet)

}

// MARK: Generated accessors for comicDates
extension Comic {

    @objc(insertObject:inComicDatesAtIndex:)
    @NSManaged public func insertIntoComicDates(_ value: ComicDate, at idx: Int)

    @objc(removeObjectFromComicDatesAtIndex:)
    @NSManaged public func removeFromComicDates(at idx: Int)

    @objc(insertComicDates:atIndexes:)
    @NSManaged public func insertIntoComicDates(_ values: [ComicDate], at indexes: NSIndexSet)

    @objc(removeComicDatesAtIndexes:)
    @NSManaged public func removeFromComicDates(at indexes: NSIndexSet)

    @objc(replaceObjectInComicDatesAtIndex:withObject:)
    @NSManaged public func replaceComicDates(at idx: Int, with value: ComicDate)

    @objc(replaceComicDatesAtIndexes:withComicDates:)
    @NSManaged public func replaceComicDates(at indexes: NSIndexSet, with values: [ComicDate])

    @objc(addComicDatesObject:)
    @NSManaged public func addToComicDates(_ value: ComicDate)

    @objc(removeComicDatesObject:)
    @NSManaged public func removeFromComicDates(_ value: ComicDate)

    @objc(addComicDates:)
    @NSManaged public func addToComicDates(_ values: NSOrderedSet)

    @objc(removeComicDates:)
    @NSManaged public func removeFromComicDates(_ values: NSOrderedSet)

}

// MARK: Generated accessors for creators
extension Comic {

    @objc(insertObject:inCreatorsAtIndex:)
    @NSManaged public func insertIntoCreators(_ value: Creator, at idx: Int)

    @objc(removeObjectFromCreatorsAtIndex:)
    @NSManaged public func removeFromCreators(at idx: Int)

    @objc(insertCreators:atIndexes:)
    @NSManaged public func insertIntoCreators(_ values: [Creator], at indexes: NSIndexSet)

    @objc(removeCreatorsAtIndexes:)
    @NSManaged public func removeFromCreators(at indexes: NSIndexSet)

    @objc(replaceObjectInCreatorsAtIndex:withObject:)
    @NSManaged public func replaceCreators(at idx: Int, with value: Creator)

    @objc(replaceCreatorsAtIndexes:withCreators:)
    @NSManaged public func replaceCreators(at indexes: NSIndexSet, with values: [Creator])

    @objc(addCreatorsObject:)
    @NSManaged public func addToCreators(_ value: Creator)

    @objc(removeCreatorsObject:)
    @NSManaged public func removeFromCreators(_ value: Creator)

    @objc(addCreators:)
    @NSManaged public func addToCreators(_ values: NSOrderedSet)

    @objc(removeCreators:)
    @NSManaged public func removeFromCreators(_ values: NSOrderedSet)

}

// MARK: Generated accessors for textObjects
extension Comic {

    @objc(insertObject:inTextObjectsAtIndex:)
    @NSManaged public func insertIntoTextObjects(_ value: TextObject, at idx: Int)

    @objc(removeObjectFromTextObjectsAtIndex:)
    @NSManaged public func removeFromTextObjects(at idx: Int)

    @objc(insertTextObjects:atIndexes:)
    @NSManaged public func insertIntoTextObjects(_ values: [TextObject], at indexes: NSIndexSet)

    @objc(removeTextObjectsAtIndexes:)
    @NSManaged public func removeFromTextObjects(at indexes: NSIndexSet)

    @objc(replaceObjectInTextObjectsAtIndex:withObject:)
    @NSManaged public func replaceTextObjects(at idx: Int, with value: TextObject)

    @objc(replaceTextObjectsAtIndexes:withTextObjects:)
    @NSManaged public func replaceTextObjects(at indexes: NSIndexSet, with values: [TextObject])

    @objc(addTextObjectsObject:)
    @NSManaged public func addToTextObjects(_ value: TextObject)

    @objc(removeTextObjectsObject:)
    @NSManaged public func removeFromTextObjects(_ value: TextObject)

    @objc(addTextObjects:)
    @NSManaged public func addToTextObjects(_ values: NSOrderedSet)

    @objc(removeTextObjects:)
    @NSManaged public func removeFromTextObjects(_ values: NSOrderedSet)

}

// MARK: Generated accessors for urls
extension Comic {

    @objc(insertObject:inUrlsAtIndex:)
    @NSManaged public func insertIntoUrls(_ value: Url, at idx: Int)

    @objc(removeObjectFromUrlsAtIndex:)
    @NSManaged public func removeFromUrls(at idx: Int)

    @objc(insertUrls:atIndexes:)
    @NSManaged public func insertIntoUrls(_ values: [Url], at indexes: NSIndexSet)

    @objc(removeUrlsAtIndexes:)
    @NSManaged public func removeFromUrls(at indexes: NSIndexSet)

    @objc(replaceObjectInUrlsAtIndex:withObject:)
    @NSManaged public func replaceUrls(at idx: Int, with value: Url)

    @objc(replaceUrlsAtIndexes:withUrls:)
    @NSManaged public func replaceUrls(at indexes: NSIndexSet, with values: [Url])

    @objc(addUrlsObject:)
    @NSManaged public func addToUrls(_ value: Url)

    @objc(removeUrlsObject:)
    @NSManaged public func removeFromUrls(_ value: Url)

    @objc(addUrls:)
    @NSManaged public func addToUrls(_ values: NSOrderedSet)

    @objc(removeUrls:)
    @NSManaged public func removeFromUrls(_ values: NSOrderedSet)

}

extension Comic : Identifiable {

}
