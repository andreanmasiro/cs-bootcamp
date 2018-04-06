//
//  GenresCacheGateway.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 04/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

protocol GenresCacheGateway {
    
    func addGenres(_ genres: [Genre], _ completion: @escaping (Result<Void>) -> ())
    func fetchGenres(withIds ids: [Int], _ completion: @escaping (Result<[Genre]>) -> ())
    func fetchGenres(_ completion: @escaping (Result<[Genre]>) -> ())
}
