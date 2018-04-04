//
//  GenreCoreData+CoreDataProperties.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 04/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//
//

import Foundation
import CoreData


extension GenreCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GenreCoreData> {
        return NSFetchRequest<GenreCoreData>(entityName: entityName)
    }

    @NSManaged public var id: Int
    @NSManaged public var name: String
    @NSManaged public var movies: NSOrderedSet
}
