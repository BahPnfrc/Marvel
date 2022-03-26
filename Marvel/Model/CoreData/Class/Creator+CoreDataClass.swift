//
//  Creator+CoreDataClass.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 26/03/2022.
//
//

import Foundation
import CoreData

@objc(Creator)
public class Creator: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
            case name
            case resourceURL
            case role
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
            self.name = try container.decode(String.self, forKey: .name)
            self.resourceURL = try container.decodeIfPresent(String.self, forKey: .resourceURL)
            self.role = try container.decodeIfPresent(String.self, forKey: .role)
        } catch let error as NSError {
            throw NSError(trouble: .jsonWrongData, description: "\(currentClassName): JSON data is wrong.", failureReason: "Mistyped content", underlyingError: error)
        }
    }
    
    // MARK: - Codable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(resourceURL, forKey: .resourceURL)
        try container.encodeIfPresent(role, forKey: .role)
    }
    
}
