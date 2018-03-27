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
    private let jsonDecoder: JSONDecoder = {
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        return decoder
    }()
    
    func fetchMovies(_ completion: @escaping (Result<[Movie]>) -> ()) {
        
        provider.request(.popular) { [weak self] result in
            
            guard let `self` = self else { return }
            
            switch result {
                
            case .success(let value):
                
                do {
                    
                    let movieList = try self.jsonDecoder.decode(MovieList.self, from: value.data)
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
