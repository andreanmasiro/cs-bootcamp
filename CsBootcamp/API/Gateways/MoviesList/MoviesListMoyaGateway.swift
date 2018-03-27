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
    
    func fetchMovies(_ completion: @escaping (Result<[Movie]>) -> ()) {
        
        provider.request(.popular) { result in
            
            switch result {
                
            case .success(let value):
                
                do {
                    
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    
                    var a: JSONDecoder.DateDecodingStrategy!
                    
                    
                    let movieList = try decoder.decode(MovieList.self, from: value.data)
                    completion(.success(movieList.results))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                
                completion(.failure(error))
            }
        }
    }
}
