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
    
    init(presenter: FavoritesListPresenter) {
        self.presenter = presenter
    }
    
    func fetchFavorites() {
        
        let favorites: [Movie] = (0..<5).map {_ in
            
            let movie = Movie(id: 0, genreIds: [1, 2, 3, 4], title: "Star Wars - The Last Jedi", overview: "Rey develops her newly discovered abilities with the guidance of Luke Skywalker, who is unsettled by the strength of her powers. Meanwhile, the Resistance prepares for battle with the First Order.", releaseDate: Date(), posterPath: "/kOVEVeg59E0wsnXmF9nrh6OmWII.jpg")
            
            return movie
        }
        
        presenter.presentFavorites(favorites)
    }
}
