//
//  Date+Formatter.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 26/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

extension Date {
    
    func yearToString() -> String {
        
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: self)
        
        return "\(year)"
    }
    
}
