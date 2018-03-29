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
    
    enum Error: Swift.Error {
        
    }
    
    private let provider = MoyaProvider<MovieTarget>()
    private lazy var jsonDecoder: JSONDecoder = {
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        return decoder
    }()
    
    func fetchMovies(_ completion: @escaping (Result<[Movie]>) -> ()) {
        
        provider.requestDecodable(.popular, jsonDecoder: jsonDecoder) { (result: Result<MovieList>) in
            
            let result = result.map { moviesList in moviesList.results }
            completion(result)
        }
    }
}
