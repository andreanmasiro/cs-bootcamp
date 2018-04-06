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
    
    init(presenter: FavoritesListPresenter, favoriteMoviesListGateway: FavoriteMoviesListGateway) {
        self.presenter = presenter
        self.favoriteMoviesListGateway = favoriteMoviesListGateway
    }
    
    func fetchFavorites() {
        
        let result = favoriteMoviesListGateway.fetchMovies()
        if let movies = result.value {   
            presenter.presentFavorites(movies)
        }
    }
}
