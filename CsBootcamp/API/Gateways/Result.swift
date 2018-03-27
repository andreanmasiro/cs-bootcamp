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
    
    func map<U>(_ transform: (T) -> (U)) -> Result<U> {
        
        switch self {
            
        case .success(let value):
            let transformedValue = transform(value)
            return Result<U>.success(transformedValue)
            
        case .failure(let error):
            return Result<U>.failure(error)
        }
    }
}

