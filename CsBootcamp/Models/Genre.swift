//
//  Genre.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

struct Genre: Codable {
    
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        
        self.id = id
        self.name = name
    }
}
