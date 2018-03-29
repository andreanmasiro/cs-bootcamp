//
//  Moya+Decodable.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 27/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Moya

extension MoyaProvider {
    
    func requestDecodable<T: Decodable>(_ target: Target, jsonDecoder: JSONDecoder, _ completion: @escaping (Result<T>) -> ()) {
        
        request(target) { result in
            
            switch result {
                
            case .success(let value):
                
                do {
                    let decoded = try jsonDecoder.decode(T.self, from: value.data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                
                completion(.failure(error))
            }
        }
    }
}
