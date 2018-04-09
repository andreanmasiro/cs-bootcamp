//
//  MovieFilter.swift
//  CsBootcamp
//
//  Created by André Marques da Silva Rodrigues on 08/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

final class MovieFilter {
    
    private var commitSnapshot: (
    genreFilter: Genre?,
    releaseYearFilter: Int?,
    genreFilterIndex: Int?,
    releaseYearFilterIndex: Int?
    )
    
    var genreFilter: Genre?
    var releaseYearFilter: Int?
    
    var genreFilterIndex: Int?
    var releaseYearFilterIndex: Int?
    
    init() {
        commitSnapshot = (nil, nil, nil, nil)
    }
    
    var hasFilter: Bool {
        return genreFilter != nil || releaseYearFilter != nil
    }
    
    func clearFilter() {
        genreFilter = nil
        releaseYearFilter = nil
        genreFilterIndex = nil
        releaseYearFilterIndex = nil
    }
    
    func commit() {
        commitSnapshot = (genreFilter, releaseYearFilter, genreFilterIndex, releaseYearFilterIndex)
    }
    
    func rollback() {
        (genreFilter, releaseYearFilter, genreFilterIndex, releaseYearFilterIndex) = commitSnapshot
    }
}
