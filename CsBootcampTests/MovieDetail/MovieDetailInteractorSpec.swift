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

        var movieDetailPresenterSpy: MovieDetailPresenterSpy!
        var sut: MovieDetailInteractor!
        
        describe("MovieDetailInteractor", closure: {
            
            beforeSuite {
                movieDetailPresenterSpy = MovieDetailPresenterSpy()
                sut = MovieDetailInteractor(presenter: movieDetailPresenterSpy)
    
            }
            
            context("When is initialized", closure: {
                
                it("should verify if presenter parameter isn't nil", closure: {
                    expect(sut.presenter).toNot(beNil())
                })
                
            })
            
            context("When interactor called fetchMovie method", closure: {
                
                beforeEach {
                    sut.fetchMovie()
                }
                
                it("presentMovie method should be called too", closure: {
                    expect(movieDetailPresenterSpy.isPresentMovieCalled).to(beTrue())
                })
                
            })
            
        })
        
    }
}

class MovieDetailPresenterSpy: MovieDetailPresenterType {
    
    var isPresentMovieCalled = false
    
    func presentMovie(_ movie: Movie, _ genres: [Genre]) {
        isPresentMovieCalled = true
    }
}
