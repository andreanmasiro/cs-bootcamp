//
//  Movie.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    
    let id: Int
    let genreIds: [Int]
    let title: String
    let overview: String
    let releaseDate: Date
    let posterPath: String
}
