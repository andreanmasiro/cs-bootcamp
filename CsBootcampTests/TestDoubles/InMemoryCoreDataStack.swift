//
//  InMemoryCoreDataStack.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 06/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import CoreData

@testable import CsBootcamp

final class InMemoryCoreDataStack: CoreDataStack {
    
    let container: NSPersistentContainer
    
    init() {
        
        let managedObjectModel: NSManagedObjectModel = {
            let url = Bundle.main.url(forResource: "Movies", withExtension: "momd")!
            return NSManagedObjectModel(contentsOf: url)!
        }()
        
        container = NSPersistentContainer(name: "Movies", managedObjectModel: managedObjectModel)
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [description]
        
        container.loadPersistentStores { _, error in
            error.map { print($0) }
        }
    }
    
    lazy var context: NSManagedObjectContext = {
        container.viewContext
    }()
    
    func saveContext() {
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}
