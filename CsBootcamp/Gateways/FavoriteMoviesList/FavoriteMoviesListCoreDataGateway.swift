//
//  FavoriteMoviesListCoreDataGateway.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 04/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation
import CoreData

final class FavoriteMoviesListCoreDataGateway: FavoriteMoviesListGateway {
    
    enum Error: Swift.Error {
        case addError
    }
    
    private let coreDataStack: CoreDataStack
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    func addMovie(_ movie: Movie, _ completion: @escaping (Result<Void>) -> ()) {
        
        guard let movieCoreData = NSEntityDescription.insertNewObject(forEntityName: "MovieCoreData", into: coreDataStack.context) as? MovieCoreData else {
            completion(.failure(Error.addError))
            return
        }
        movieCoreData.id = Int32(movie.id)
        movieCoreData.title = movie.title
        movieCoreData.overview = movie.overview
        movieCoreData.posterPath = movie.posterPath
        movieCoreData.genres = []
        movieCoreData.releaseDate = movie.releaseDate
        
        coreDataStack.saveContext()
        
        completion(.success(()))
    }
    
    func removeMovie(_ movie: Movie, _ completion: @escaping (Result<Void>) -> ()) {
        
        let request: NSFetchRequest<MovieCoreData> = MovieCoreData.fetchRequest()
        let predicate = NSPredicate(format: "id == %d", movie.id)
        request.predicate = predicate
        
        do {
            let moviesCoreData = try coreDataStack.context.fetch(request)
            moviesCoreData.forEach(coreDataStack.context.delete)
            completion(.success(()))
            
        } catch {
            completion(.failure(error))
        }
    }
    
    func fetchMovies(_ completion: @escaping (Result<[Movie]>) -> ()) {
        
        let request: NSFetchRequest<MovieCoreData> = MovieCoreData.fetchRequest()
        
        do {
            let moviesCoreData = try coreDataStack.context.fetch(request)
            
            let movies = moviesCoreData.map { movieCoreData in
                
                Movie(
                    id: Int(movieCoreData.id),
                    genreIds: movieCoreData.genres.map {
                        genre in
                        Int((genre as! GenreCoreData).id)
                    },
                    title: movieCoreData.title,
                    overview: movieCoreData.overview,
                    releaseDate: movieCoreData.releaseDate,
                    posterPath: movieCoreData.posterPath
                )
            }
            completion(.success(movies))
            
        } catch {
            completion(.failure(error))
        }
    }
}

