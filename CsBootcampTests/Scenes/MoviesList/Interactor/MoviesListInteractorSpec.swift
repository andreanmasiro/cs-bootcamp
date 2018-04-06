//
//  MoviesListInteractorSpec.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MoviesListInteractorSpec: QuickSpec {
    
    override func spec() {
        
        describe("MoviesListInteractor") {
            
            var presenter: MoviesListPresenterSpy!
            var gateway: MoviesListGatewayStub!
            var interactor: MoviesListInteractor!
            var favoriteMovieListGateway: FavoriteMoviesListGatewayStub!
            
            context("when initialized") {
                
                let isMovieFavoriteStub = true
                beforeEach {
                    presenter = MoviesListPresenterSpy()
                    gateway = MoviesListGatewayStub()
                    favoriteMovieListGateway = FavoriteMoviesListGatewayStub()
                    favoriteMovieListGateway.isMovieFavoriteResultStub = .success(isMovieFavoriteStub)
                    interactor = MoviesListInteractor(presenter: presenter, moviesListGateway: gateway, favoriteMoviesListGateway: favoriteMovieListGateway)
                }
                
                context("and fetch movies is called") {
                    
                    context("and it succeeds") {
                        
                        let movies = (0..<3).map { id in
                            Movie(id: id, genreIds: [], title: "", overview: "", releaseDate: Date(), posterPath: "")
                        }
                        
                        let expectedResponse = movies.map { movie in
                            FetchMoviesListResponse(posterPath: movie.posterPath, title: movie.title, isFavorite: isMovieFavoriteStub)
                        }
                        
                        beforeEach {
                            
                            gateway.result = .success(movies)
                            interactor.fetchMovies(from: 1)
                        }
                        
                        it("should present the returned movies") {
                            
                            expect(presenter.presentMoviesCalled).to(beTrue())
                            expect(presenter.presentMoviesArg).to(equal(expectedResponse))
                        }
                    }
                    
                    context("and it fails") {
                        
                        beforeEach {
                            
                            let error = NSError() as Error
                            gateway.result = .failure(error)
                            interactor.fetchMovies(from: 1)
                        }
                        
                        it("should present error") {
                            
                            expect(presenter.presentErrorCalled).to(beTrue())
                        }
                    }
                }
            }
        }
    }
}

final class MoviesListPresenterSpy: MoviesListPresenterType {
    
    var presentMoviesCalled = false
    var presentMoviesArg: [FetchMoviesListResponse]?
    var presentErrorCalled = false
    
    func presentMovies(_ movies: [FetchMoviesListResponse]) {
        presentMoviesCalled = true
        presentMoviesArg = movies
    }
    
    func presentError() {
        presentErrorCalled = true
    }
}

final class MoviesListGatewayStub: MoviesListGateway {
    
    var result: Result<[Movie]>!
    
    func fetchMovies(page: Int, _ completion: @escaping (Result<[Movie]>) -> ()) {
        completion(result)
    }
}

final class FavoriteMoviesListGatewayStub: FavoriteMoviesListGateway {
    
    var isMovieFavoriteResultStub: Result<Bool>!
    
    func toggleMovieFavorite(_ movie: Movie) -> Result<Bool> {
        return .success(true)
    }
    
    func setMovie(_ movie: Movie, favorite: Bool) -> Result<Void> {
        return .success(())
    }
    
    func fetchMovies() -> Result<[Movie]> {
        return .success([])
    }
    
    func isMovieFavorite(_ movie: Movie) -> Result<Bool> {
        return isMovieFavoriteResultStub
    }
}
