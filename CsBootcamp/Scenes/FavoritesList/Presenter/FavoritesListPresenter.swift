//
//  FavoritesListPresenter.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 04/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

protocol FavoritesListView: class {
    
    func displayFavorites(viewModels: [FavoriteTableViewCell.ViewModel])
}

class FavoritesListPresenter: FavoritesListPresenterType {
    
    weak var view: FavoritesListView?
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }()
    
    init(view: FavoritesListView) {
        
        self.view = view
    }
    
    func presentFavorites(_ movies: [Movie]) {
        
        let viewModels: [FavoriteTableViewCell.ViewModel] = movies.map { movie in
            
            FavoriteTableViewCell.ViewModel(posterUrl: APIBase.posterImageURL(path: movie.posterPath), title: movie.title, releaseDate: dateFormatter.string(from: movie.releaseDate), overview: movie.overview)
            
        }
        
        view?.displayFavorites(viewModels: viewModels)
    }
}
