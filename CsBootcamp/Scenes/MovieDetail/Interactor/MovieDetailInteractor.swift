//
//  MovieDetailInteractor.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 26/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

final class MovieDetailInteractor: MovieDetailInteractorType {
    
    var movie: Movie?

    private let presenter: MovieDetailPresenterType
    private let genresCacheGateway: GenresCacheGateway
    private let favoriteMoviesListGateway: FavoriteMoviesListGateway
    
    init(presenter: MovieDetailPresenterType, genresGateway: GenresCacheGateway, favoriteMoviesListGateway: FavoriteMoviesListGateway) {
        self.presenter = presenter
        self.genresCacheGateway = genresGateway
        self.favoriteMoviesListGateway = favoriteMoviesListGateway
    }
    
    func fetchDetail(of movie: Movie) {
        
        
        genresCacheGateway.fetchGenres(withIds: movie.genreIds) { [weak self] result in

            guard let `self` = self else { return }
            
            let isFavoriteResult = self.favoriteMoviesListGateway.isMovieFavorite(movie)
            
            if case let .success(genres) = result,
                case let .success(isFavorite) = isFavoriteResult {
                
                self.movie = movie
                let genreNames = genres.map { genre in genre.name }
                
                let response = FetchMovieDetailResponse(
                    posterPath: movie.posterPath,
                    releaseDate: movie.releaseDate,
                    title: movie.title,
                    overview: movie.overview,
                    isFavorite: isFavorite,
                    genreNames: genreNames
                )
                
                self.presenter.presentMovie(response: response)
            }
        }
    }
}
