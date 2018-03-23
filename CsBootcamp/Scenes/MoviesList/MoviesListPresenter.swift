//
//  MoviesListPresenter.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

protocol MoviesListView: class {
    
    func displayMovies(viewModels: [MovieCollectionViewCell.ViewModel])
}

final class MoviesListPresenter: MoviesListPresenterType {
    
    unowned let view: MoviesListView
    
    init(view: MoviesListView) {
        
        self.view = view
    }
    
    func presentMovies() {
        
        
    }
}
