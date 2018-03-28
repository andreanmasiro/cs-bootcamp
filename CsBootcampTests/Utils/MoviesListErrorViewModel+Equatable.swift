//
//  MoviesListErrorViewModel+Equatable.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

@testable import CsBootcamp

extension MoviesListErrorViewModel: Equatable {
    
    public static func ==(lhs: MoviesListErrorViewModel, rhs: MoviesListErrorViewModel) -> Bool {
        return lhs.image == rhs.image &&
            lhs.message == rhs.message
    }
}
