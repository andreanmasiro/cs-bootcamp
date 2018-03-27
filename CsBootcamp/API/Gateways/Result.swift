//
//  Result.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 27/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

enum Result<T> {
    
    case success(T)
    case failure(Error)
}
