//
//  Comic+CoreDataClass.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 26/03/2022.
//
//

import Foundation
import CoreData

@objc(Comic)
public class Comic: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case timeStamp
        case isFavorite
        
        case id
        case format
        case modified
        case pageCount
        case thumbnail
        case title
    }
    
    // MARK: - Decodable
    
    public convenience required init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
              let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: NSStringFromClass(Swift.type(of: self)), in: managedObjectContext) else {
            throw NSError(trouble: .coreDataOperationIssue, description: "Could not create a \(NSStringFromClass(Swift.type(of: self))) entity")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            self.timeStamp = Date.now
            self.isFavorite = try CoreDataService.shared.isFavorite(self.id)
            
            self.id = try container.decode(Int64.self, forKey: .id)
            self.format = try container.decodeIfPresent(String.self, forKey: .format)
            self.modified = try container.decodeIfPresent(String.self, forKey: .modified)?.toDate()
            self.pageCount = try container.decode(Int64.self, forKey: .pageCount)
            self.thumbnail = try container.decodeIfPresent(Data.self, forKey: .thumbnail)
            self.title = try container.decodeIfPresent(String.self, forKey: .title)
        } catch let error as NSError {
            throw NSError(trouble: .jsonWrongData, description: "\(currentClassName): JSON data is wrong.", failureReason: "Mistyped content", underlyingError: error)
        }
    }
    
    // MARK: - Codable
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(timeStamp, forKey: .timeStamp)
        try container.encode(isFavorite, forKey: .isFavorite)
        
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(format, forKey: .format)
        try container.encodeIfPresent(modified, forKey: .modified)
        try container.encode(pageCount, forKey: .pageCount)
        try container.encodeIfPresent(thumbnail, forKey: .thumbnail)
        try container.encodeIfPresent(title, forKey: .title)
    }
    
}
