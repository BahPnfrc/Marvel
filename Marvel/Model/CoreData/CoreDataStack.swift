//
//  CoreDataStack.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 25/03/2022.
//

import Foundation
import CoreData

public enum CoreDataStorage {
    case persistent, inMemory
}

public enum CoreDataError: Error {
    case saving
}

final class CoreDataStack {
    
    // MARK: - Variable
    
    private let persistentContainer: NSPersistentContainer
    
    // MARK: - Initializer
    
    init(_ storageType: CoreDataStorage = .persistent) {
        persistentContainer = NSPersistentContainer(name: "Marvel")
        if storageType == .inMemory {
            let description = NSPersistentStoreDescription()
            description.url = URL(fileURLWithPath: "/dev/null")
            persistentContainer.persistentStoreDescriptions = [description]
        }
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    // MARK: - Stack
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveContext() throws {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
            throw CoreDataError.saving
        }
    }
    
}
