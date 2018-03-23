//
//  MoviesListInteractor.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

protocol MoviesListPresenterType {
    
    func presentMovies()
}

final class MoviesListInteractor: MoviesListInteractorType {
    
    let presenter: MoviesListPresenterType
    
    init(presenter: MoviesListPresenterType) {
        self.presenter = presenter
    }
    
    func fetchMovies() {
     
        // presenter.presentMovies(movies)
        // presenter.presentError(error)
    }
}
