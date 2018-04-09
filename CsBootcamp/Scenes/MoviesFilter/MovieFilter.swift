//
//  MovieFilter.swift
//  CsBootcamp
//
//  Created by André Marques da Silva Rodrigues on 08/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

final class MovieFilter {
    
    var genreFilter: Genre?
    var releaseYearFilter: Int?
    
    var genreFilterIndex: Int?
    var releaseYearFilterIndex: Int?
    
    var hasFilter: Bool {
        return genreFilter != nil || releaseYearFilter != nil
    }
    
    func clearFilter() {
        genreFilter = nil
        releaseYearFilter = nil
        genreFilterIndex = nil
        releaseYearFilterIndex = nil
    }
}
