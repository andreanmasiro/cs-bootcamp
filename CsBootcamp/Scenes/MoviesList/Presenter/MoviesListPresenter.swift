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
    func displayError(viewModel: MoviesListErrorViewModel)
}

final class MoviesListPresenter: MoviesListPresenterType {
    
    private unowned let view: MoviesListView
    
    init(view: MoviesListView) {
        
        self.view = view
    }
    
    func presentMovies(_ movies: [Movie]) {
        
        let cellViewModels = movies.map { movie in
            MovieCollectionViewCell.ViewModel(
                imageURL: APIBase.posterImageURL(path: movie.posterPath),
                title: movie.title
            )
        }
        
        let viewModel = MoviesListViewModel(cellViewModels: cellViewModels)
        view.displayMovies(viewModel: viewModel)
    }
    
    func presentError() {
        
        view.displayError(viewModel: MoviesListErrorViewModel.defaultError)
    }
}
