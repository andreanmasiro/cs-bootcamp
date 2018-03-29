//
//  MoviesListViewModel+Equatable.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

@testable import CsBootcamp

extension MoviesListViewModel: Equatable {
    
    public static func ==(lhs: MoviesListViewModel, rhs: MoviesListViewModel) -> Bool {
        
        return lhs.cellViewModels == rhs.cellViewModels
    }
}
