//
//  GenresCacheCoreDataGateway.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 04/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation
import CoreData

final class GenresCacheCoreDataGateway: GenresCacheGateway {
    
    enum Error: Swift.Error {
        case addError
    }
    
    private let coreDataStack: CoreDataStack
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    func addGenres(_ genres: [Genre], _ completion: @escaping (Result<Void>) -> ()) {
        
        genres.forEach { genre in
            
            guard let genreCoreData = NSEntityDescription.insertNewObject(ofType: GenreCoreData.self, into: coreDataStack.context) else {
                completion(.failure(Error.addError))
                return
            }
            
            genreCoreData.id = genre.id
            genreCoreData.name = genre.name
        }
        
        coreDataStack.saveContext()
        completion(.success(()))
    }
    
    func fetchGenres(withIds ids: [Int], _ completion: @escaping (Result<[Genre]>) -> ()) {
        
        let request: NSFetchRequest<GenreCoreData> = GenreCoreData.fetchRequest()
        let predicate = NSPredicate(format: "id IN %@", ids)
        request.predicate = predicate
        
        fetchGenres(request: request, completion)
    }
    
    func fetchGenres(_ completion: @escaping (Result<[Genre]>) -> ()) {
        
        let request: NSFetchRequest<GenreCoreData> = GenreCoreData.fetchRequest()
        fetchGenres(request: request, completion)
    }
    
    private func fetchGenres(request: NSFetchRequest<GenreCoreData>, _ completion: @escaping (Result<[Genre]>) -> ()) {
        
        do {
            let genresCoreData = try coreDataStack.context.fetch(request)
            
            let genres = genresCoreData.map { genreCoreData in
                Genre(id: genreCoreData.id, name: genreCoreData.name)
            }
            
            completion(.success(genres))
            
        } catch {
            completion(.failure(error))
        }
    }
}
