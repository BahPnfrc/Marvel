//
//  ComicDate+CoreDataClass.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 26/03/2022.
//
//

import Foundation
import CoreData

@objc(ComicDate)
public class ComicDate: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case date
        case type
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
            self.date = try container.decode(String.self, forKey: .date).toDate()
            self.type = try container.decodeIfPresent(String.self, forKey: .type)
        } catch let error as NSError {
            throw NSError(trouble: .jsonWrongData, description: "\(currentClassName): JSON data is wrong.", failureReason: "Mistyped content", underlyingError: error)
        }
    }
    
    // MARK: - Codable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encodeIfPresent(type, forKey: .type)
    }

}
