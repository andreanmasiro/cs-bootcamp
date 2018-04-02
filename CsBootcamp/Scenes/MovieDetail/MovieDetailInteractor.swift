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
    let genresListGateway: GenresListGateway
    
    init(presenter: MovieDetailPresenterType, genresListGateway: GenresListGateway) {
        self.presenter = presenter
        self.genresListGateway = genresListGateway
    }
    
    func fetchDetail(of movie: Movie) {
        
        genresListGateway.fetchGenres { [weak self] result in
            
            guard let `self` = self else { return }
            if case let .success(genres) = result {
                let genres = genres.filter { genre in movie.genreIds.contains(genre.id) }
                self.presenter.presentMovie(movie, genres)
            }
        }
    }
}
