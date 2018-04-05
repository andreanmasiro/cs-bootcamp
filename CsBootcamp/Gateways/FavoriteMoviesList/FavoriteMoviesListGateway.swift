//
//  FavoriteMoviesListGateway.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 04/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

protocol FavoriteMoviesListGateway {
    
    func toggleMovieFavorite(_ movie: Movie) -> Result<Bool>
    func fetchMovies() -> Result<[Movie]>
    func isMovieFavorite(_ movie: Movie) -> Result<Bool>
}
