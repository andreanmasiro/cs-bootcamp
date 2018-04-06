//
//  CoreDataStack.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 05/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import CoreData

protocol CoreDataStack {
    
    var persistentContainer: NSPersistentContainer { get }
    var context: NSManagedObjectContext { get }
    func saveContext()
}
