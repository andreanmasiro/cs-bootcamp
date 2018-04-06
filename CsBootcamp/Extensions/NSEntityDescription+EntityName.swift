//
//  NSEntityDescription+EntityName.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 04/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import CoreData

extension NSEntityDescription {
    
    static func insertNewObject<T: NSManagedObject>(ofType type: T.Type, into context: NSManagedObjectContext) -> T? {
        
        return insertNewObject(forEntityName: T.entityName, into: context) as? T
    }
}
