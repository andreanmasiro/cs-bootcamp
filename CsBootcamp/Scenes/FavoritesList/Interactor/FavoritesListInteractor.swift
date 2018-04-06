//
//  FavoritesListInteractor.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 04/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

final class FavoritesListInteractor: FavoritesListInteractorType {
    
    private let presenter: FavoritesListPresenterType
    private let favoriteMoviesListGateway: FavoriteMoviesListGateway
    
    private var movies: [Movie]?
    
    init(presenter: FavoritesListPresenter, favoriteMoviesListGateway: FavoriteMoviesListGateway) {
        self.presenter = presenter
        self.favoriteMoviesListGateway = favoriteMoviesListGateway
    }
    
    func fetchFavorites() {
        
        let result = favoriteMoviesListGateway.fetchMovies()
        if let movies = result.value {
            presentFavorites(movies)
        }
    }
    
    func removeFavorite(at index: Int) {
        
        guard var movies = movies else { return }
        
        let movie = movies[index]
        if favoriteMoviesListGateway.setMovie(movie, favorite: false).value != nil {
            movies.remove(at: index)
        }
        presentFavorites(movies)
    }
    
    private func presentFavorites(_ movies: [Movie]) {
        self.movies = movies
        presenter.presentFavorites(movies)
    }
}
