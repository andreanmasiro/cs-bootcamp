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
    
    let presenter: MoviesListPresenterType
    
    private let moviesListGateway: MoviesListGateway
    
    init(presenter: MoviesListPresenterType, moviesListGateway: MoviesListGateway) {
        self.presenter = presenter
        self.moviesListGateway = moviesListGateway
    }
    
    func fetchMovies() {
     
        moviesListGateway.fetchMovies { [weak self] result in
            
            switch result {
                
            case .success(let movies):
                self?.presenter.presentMovies(movies)
            case .failure(_): break
                 self?.presenter.presentError()
            }
        }
    }
}
