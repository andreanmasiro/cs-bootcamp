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
    
    var movie: Movie?

    private let presenter: MovieDetailPresenterType
    private let genresCacheGateway: GenresCacheGateway
    
    init(presenter: MovieDetailPresenterType, genresGateway: GenresCacheGateway) {
        self.presenter = presenter
        self.genresCacheGateway = genresGateway
    }
    
    func fetchDetail(of movie: Movie) {
        
        genresCacheGateway.fetchGenres(withIds: movie.genreIds) { [weak self] result in
            
            guard let `self` = self else { return }
            if case let .success(genres) = result {
                self.movie = movie
                self.presenter.presentMovie(movie, genres)
            }
        }
    }
}
