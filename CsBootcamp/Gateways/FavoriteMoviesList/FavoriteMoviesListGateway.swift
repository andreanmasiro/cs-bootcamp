//
//  FavoriteMoviesListGateway.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 04/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

protocol FavoriteMoviesListGateway {
    
    func toggleMovieFavorite(_ movie: Movie) -> Result<Bool>
    @discardableResult func setMovie(_ movie: Movie, favorite: Bool) -> Result<Void>
    func fetchMovies() -> Result<[Movie]>
    func isMovieFavorite(_ movie: Movie) -> Result<Bool>
}
