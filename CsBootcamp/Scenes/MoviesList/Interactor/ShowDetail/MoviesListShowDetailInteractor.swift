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
    
    private weak var showMovieDetailNavigator: ShowMovieDetailNavigator?
    
    init(showMovieDetailNavigator: ShowMovieDetailNavigator) {
        self.showMovieDetailNavigator = showMovieDetailNavigator
    }
    
    func showDetail(forMovie movie: Movie) {
        showMovieDetailNavigator?.navigate(toDetailOf: movie)
    }
}
