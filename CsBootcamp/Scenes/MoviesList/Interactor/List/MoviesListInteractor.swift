//
//  MoviesListInteractor.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

final class MoviesListInteractor: MoviesListInteractorType, MovieListFavoriteInteractorType {
    
    private var movies = [Movie]()
    
    private let presenter: MoviesListPresenterType
    private let moviesListGateway: MoviesListGateway
    private let favoriteMoviesListGateway: FavoriteMoviesListGateway
    
    init(presenter: MoviesListPresenterType, moviesListGateway: MoviesListGateway, favoriteMoviesListGateway: FavoriteMoviesListGateway) {
        self.presenter = presenter
        self.moviesListGateway = moviesListGateway
        self.favoriteMoviesListGateway = favoriteMoviesListGateway
    }
    
    func movie(at index: Int) -> Movie {
        return movies[index]
    }
    
    func fetchMovies(from page: Int) {
        moviesListGateway.fetchMovies(page: page) { [weak self] result in
    
            guard let `self` = self else { return }
            
            switch result {
                
            case .success(let movies):
                
                self.movies.append(contentsOf: movies)
                let responses = self.createResponses(with: self.movies)
                
                self.presenter.presentMovies(responses)
            case .failure:
                self.presenter.presentError()
            }
        }
    }
    
    private func createResponses(with movies: [Movie]) -> [FetchMoviesListResponse] {
        return movies.map { movie -> FetchMoviesListResponse in
            
            let isMovieFavorite = self.favoriteMoviesListGateway
                .isMovieFavorite(movie).value ?? false
            
            return FetchMoviesListResponse(
                posterPath: movie.posterPath,
                title: movie.title,
                isFavorite: isMovieFavorite
            )
        }
    }
    
    // MARK: MovieListFavoriteInteractorType
    
    func toggleMovieFavorite(_ movie: Movie) {
        _ = favoriteMoviesListGateway.toggleMovieFavorite(movie)
        let responses = createResponses(with: movies)
        presenter.presentMovies(responses)
    }
}

