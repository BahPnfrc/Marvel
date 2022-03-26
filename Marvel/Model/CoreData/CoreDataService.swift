//
//  CoreDataService.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 26/03/2022.
//

import Foundation
import CoreData

// MARK: - CoreDataService

class CoreDataService {

    static let shared = CoreDataService()
    private init() {}

    private var stack = CoreDataStack.init(.persistent)
    lazy var context = stack.context

    init(_ storageType: CoreDataStorage) {
        self.stack = CoreDataStack.init(storageType)
    }
}

// MARK: - CoreDataService Extension

extension CoreDataService {
    
    // MARK: CREATE
    // Use CoreData Codable
    
    // MARK: READ
    func isFavorite(_ comic: Comic) throws -> Bool {
        let request = Comic.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", "\(comic.id)")
        return try !context.fetch(request).isEmpty
    }
    
    func isFavorite(_ id: Int64) throws -> Bool {
        let request = Comic.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", "\(id)")
        return try !context.fetch(request).isEmpty
    }
    
    func getFavorites() throws -> [Comic] {
        let request = Comic.fetchRequest()
        request.predicate = NSPredicate(format: "isFavorite == %d", true)
        return try context.fetch(request)
    }
    
    func getAll() throws -> [Comic] {
        let request = Comic.fetchRequest()
        return try context.fetch(request)
    }
    
    // MARK: UPDATE
    func setFavorite(for comic: Comic, to favorite: Bool) throws {
        let request = Comic.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", "\(comic.id)")
        guard let result = try context.fetch(request).first else { return }
        result.isFavorite = favorite
        try context.save()
    }
    
    // MARK: DELETE
    func delete(_ comic: Comic) throws {
        let request = Comic.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", "\(comic.id)")
        let result = try context.fetch(request)
        for object in result { context.delete(object)}
        try context.save()
    }
    
}
