//
//  MoviesListInteractor.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

protocol MoviesListPresenterType {
    
    func presentMovies(_ movies: [Movie])
}

final class MoviesListInteractor: MoviesListInteractorType {
    
    let presenter: MoviesListPresenterType
    
    init(presenter: MoviesListPresenterType) {
        self.presenter = presenter
    }
    
    func fetchMovies() {
     
        let movies = (0..<10).map { _ in
            Movie(id: 0,
                  genreIds: [],
                  title: "Avengers",
                  overview: "Some overview",
                  releaseDate: Date(),
                  posterUrl: URL(string: "https://www.elastic.co/assets/bltada7771f270d08f6/enhanced-buzz-1492-1379411828-15.jpg")!)
        }
        
        presenter.presentMovies(movies)
    }
}
