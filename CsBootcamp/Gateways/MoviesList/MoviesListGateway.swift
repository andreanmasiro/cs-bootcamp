//
//  MoviesListGateway.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 27/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

protocol MoviesListGateway {
    
    func fetchMovies(_ completion: @escaping (Result<[Movie]>) -> ())
}
