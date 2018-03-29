//
//  MoviesListMoyaGateway.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 27/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Moya
import Result

final class MoviesListMoyaGateway: MoviesListGateway {
    
    private var cachedMovies: [Movie]?
    private let provider = MoyaProvider<MovieTarget>()
    private lazy var jsonDecoder: JSONDecoder = {
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        return decoder
    }()
    
    func fetchMovies(_ completion: @escaping (Result<[Movie]>) -> ()) {
        
        if let cachedMovies = cachedMovies {

            completion(.success(cachedMovies))
        } else {
            
            provider.requestDecodable(.popular, jsonDecoder: jsonDecoder) { [weak self] (result: Result<MovieList>) in
                
                let result = result.map { moviesList in moviesList.results }
                self?.cacheMovies(from: result)
                completion(result)
            }
        }
    }
    
    private func cacheMovies(from result: Result<[Movie]>) {
        if case .success(let value) = result {
            cachedMovies = value
        }
    }
}
