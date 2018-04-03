//
//  MoviesListShowDetailInteractor.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 29/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

protocol ShowMovieDetailNavigator: class {
    
    func navigate(toDetailOf movie: Movie)
}

final class MoviesListShowDetailInteractor: MoviesListShowDetailInteractorType {
    
    private let moviesListGateway: MoviesListGateway
    private weak var showMovieDetailNavigator: ShowMovieDetailNavigator?
    
    init(moviesListGateway: MoviesListGateway, showMovieDetailNavigator: ShowMovieDetailNavigator) {
        self.moviesListGateway = moviesListGateway
        self.showMovieDetailNavigator = showMovieDetailNavigator
    }
    
    func showDetail(forMovieAt index: Int) {
        
        moviesListGateway.fetchMovies(page: 1) { [weak self] result in
            
            if case .success(let movies) = result {
                
                let movie = movies[index]
                self?.showMovieDetailNavigator?.navigate(toDetailOf: movie)
            }
        }
    }
}
