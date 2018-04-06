//
//  MoviesListPresenterType.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 06/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

protocol MoviesListPresenterType {
    
    func presentMovies(_ movies: [FetchMoviesListResponse])
    func presentError()
}

struct FetchMoviesListResponse {
    
    let posterPath: String
    let title: String
    let isFavorite: Bool
}
