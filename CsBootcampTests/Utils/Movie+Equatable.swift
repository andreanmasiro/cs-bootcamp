//
//  Movie+Equatable.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

@testable import CsBootcamp

extension Movie: Equatable {
    
    public static func ==(lhs: Movie, rhs: Movie) -> Bool {
        
        return lhs.id == rhs.id &&
            lhs.genreIds == rhs.genreIds &&
            lhs.title == rhs.title &&
            lhs.overview == rhs.overview &&
            lhs.releaseDate == rhs.releaseDate &&
            lhs.posterPath == rhs.posterPath
    }
}
