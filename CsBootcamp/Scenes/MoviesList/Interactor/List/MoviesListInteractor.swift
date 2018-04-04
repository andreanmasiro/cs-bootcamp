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
    func presentError()
}

final class MoviesListInteractor: MoviesListInteractorType {
    
    private var movies = [Movie]()
    
    private let presenter: MoviesListPresenterType
    private let moviesListGateway: MoviesListGateway
    
    init(presenter: MoviesListPresenterType, moviesListGateway: MoviesListGateway) {
        self.presenter = presenter
        self.moviesListGateway = moviesListGateway
    }
    
    func movie(at index: Int) -> Movie {
        return movies[index]
    }
    
    func fetchMovies(from page: Int) {
        moviesListGateway.fetchMovies(page: page) { [weak self] result in
    
            guard let `self` = self else { return }
            
            switch result {
                
            case .success(let movies):
                self.movies.append(contentsOf: movies)
                self.presenter.presentMovies(self.movies)
            case .failure(_):
                self.presenter.presentError()
            }
        }
    }
}

