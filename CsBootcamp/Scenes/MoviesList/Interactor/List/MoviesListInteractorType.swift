//
//  MoviesListInteractorType.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 29/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

protocol MoviesListInteractorType {
    
    func fetchMovies(from page: Int)
    func reloadMovies()
    func movie(at index: Int) -> Movie
}
