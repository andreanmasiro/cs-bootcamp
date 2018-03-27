//
//  MoviesListPresenter.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

protocol MoviesListView: class {
    
    func displayMovies(viewModel: MoviesListViewModel)
}

final class MoviesListPresenter: MoviesListPresenterType {
    
    private typealias ViewModel = MovieCollectionViewCell.ViewModel
    
    unowned let view: MoviesListView
    
    init(view: MoviesListView) {
        
        self.view = view
    }
    
    func presentMovies(_ movies: [Movie]) {
        
        let cellViewModels = movies.map { movie in
            
            ViewModel(imageURL: APIBase.posterImageURL(path: movie.posterPath),
                      title: movie.title)
        }
        
        let viewModel = MoviesListViewModel(cellViewModels: cellViewModels)
        view.displayMovies(viewModel: viewModel)
    }
}
