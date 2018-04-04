//
//  FavoriteMoviesListGateway.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 04/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

protocol FavoriteMoviesListGateway {
    
    func addMovie(_ movie: Movie, _ completion: @escaping (Result<Void>) -> ())
    func removeMovie(_ movie: Movie, _ completion: @escaping (Result<Void>) -> ())
    func fetchMovies(_ completion: @escaping (Result<[Movie]>) -> ())
    func isMovieFavorite(_ movie: Movie, _ completion: @escaping (Result<Bool>) -> ())
}
