//
//  MovieDetailInteractor.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 26/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

protocol MovieDetailPresenterType {
    
    func presentMovie(_ movie: Movie, _ genres: [Genre])
}

final class MovieDetailInteractor: MovieDetailInteractorType {

    let presenter: MovieDetailPresenterType
    
    init(presenter: MovieDetailPresenterType) {
        self.presenter = presenter
    }
    
    func fetchDetail(of movie: Movie) {
        
        let genres = [
            Genre(id: 0, name: "Action"),
            Genre(id: 1, name: "Horror")
        ]
        presenter.presentMovie(movie, genres)
    }
}
