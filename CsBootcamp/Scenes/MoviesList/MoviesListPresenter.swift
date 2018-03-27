//
//  MoviesListPresenter.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

protocol MoviesListView: class {
    
    func displayMovies(viewModels: [MovieCollectionViewCell.ViewModel])
}

final class MoviesListPresenter: MoviesListPresenterType {
    
    private typealias ViewModel = MovieCollectionViewCell.ViewModel
    
    unowned let view: MoviesListView
    
    init(view: MoviesListView) {
        
        self.view = view
    }
    
    func presentMovies(_ movies: [Movie]) {
        
        let viewModel = movies.map { movie in
            
            ViewModel(imageURL: APIBase.posterImageURL(path: movie.posterPath),
                      title: movie.title)
        }
        
        view.displayMovies(viewModels: viewModel)
    }
}
