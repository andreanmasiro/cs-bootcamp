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
        case invalidEntityDescription
        case genresNotFound
    }
    
    private let coreDataStack: CoreDataStack
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    func addMovie(_ movie: Movie, _ completion: @escaping (Result<Void>) -> ()) {
        
        guard let movieCoreData = NSEntityDescription.insertNewObject(ofType: MovieCoreData.self, into: coreDataStack.context) else {
            completion(.failure(Error.invalidEntityDescription))
            return
        }
        
        fetchGenres(withIds: movie.genreIds) { result in
            
            guard case let .success(genres) = result else {
                
                completion(.failure(Error.genresNotFound))
                return
            }
            
            movieCoreData.id = movie.id
            movieCoreData.title = movie.title
            movieCoreData.overview = movie.overview
            movieCoreData.posterPath = movie.posterPath
            movieCoreData.addToGenres(NSOrderedSet(array: genres))
            movieCoreData.releaseDate = movie.releaseDate
            
            coreDataStack.saveContext()
            completion(.success(()))
        }
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
                        (genre as! GenreCoreData).id
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
    
    func isMovieFavorite(_ movie: Movie, _ completion: @escaping (Result<Bool>) -> ()) {
        
        let request: NSFetchRequest<MovieCoreData> = MovieCoreData.fetchRequest()
        let predicate = NSPredicate(format: "id == %d", movie.id)
        request.predicate = predicate
        
        do {
            let count = try coreDataStack.context.count(for: request)
            completion(.success(count > 0))
        } catch {
            completion(.failure(error))
        }
    }
    
    private func fetchGenres(withIds ids: [Int], _ completion: (Result<[GenreCoreData]>) -> ()) {
        
        let request: NSFetchRequest<GenreCoreData> = GenreCoreData.fetchRequest()
        let predicate = NSPredicate(format: "id IN %@", ids)
        request.predicate = predicate
        
        do {
            let genresCoreData = try coreDataStack.context.fetch(request)
            completion(.success(genresCoreData))
            
        } catch {
            completion(.failure(error))
        }
    }
}

