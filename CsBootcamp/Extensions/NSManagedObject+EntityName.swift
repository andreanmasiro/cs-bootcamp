//
//  NSManagedObject+EntityName.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 04/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import CoreData

extension NSManagedObject {
    
    static var entityName: String {
        return String(describing: self)
    }
}
