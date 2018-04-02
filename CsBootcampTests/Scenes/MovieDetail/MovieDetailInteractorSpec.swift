//
//  MovieDetailInteractorSpec.swift
//  CsBootcampTests
//
//  Created by Lucas Nascimento on 28/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MovieDetailInteractorSpec: QuickSpec {
    
    override func spec() {

        describe("MovieDetailInteractor") {
            
            context("when is initialized") {
                
                var sut: MovieDetailInteractor!
                var presenter: MovieDetailPresenterSpy!
                var gateway: GenresListGatewayStub!
                
                beforeEach {
                    presenter = MovieDetailPresenterSpy()
                    gateway = GenresListGatewayStub()
                    gateway.stubbedResult = .success([])
                    sut = MovieDetailInteractor(presenter: presenter, genresListGateway: gateway)
                }
                
                context("when fetchDetailOfMovie is called") {
                    
                    let movie = Movie(id: 0, genreIds: [], title: "", overview: "", releaseDate: Date(), posterPath: "")
                    
                    beforeEach {
                        sut.fetchDetail(of: movie)
                    }
                    
                    it("should call presentMovie") {
                        expect(presenter.isPresentMovieCalled).to(beTrue())
                    }
                }
            }
        }
    }
}

class GenresListGatewayStub: GenresListGateway {
    
    var stubbedResult: Result<[Genre]>!
    
    func fetchGenres(_ completion: @escaping (Result<[Genre]>) -> ()) {
        completion(stubbedResult)
    }
}

class MovieDetailPresenterSpy: MovieDetailPresenterType {
    
    var isPresentMovieCalled = false
    
    func presentMovie(_ movie: Movie, _ genres: [Genre]) {
        isPresentMovieCalled = true
    }
}
