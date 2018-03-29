//
//  MovieDetailPresenterSpec.swift
//  CsBootcampTests
//
//  Created by Gabriel Preto on 28/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MovieDetailPresenterSpec: QuickSpec {
    
    override func spec() {
        
        var viewController: MovieDetailViewControllerSpy!
        var sut: MovieDetailPresenter!
        var movie: Movie!
        var genre: Genre!
        var genres: [Genre]!
        
        describe("MovieDetailPresenter", closure: {
            
            beforeSuite {
                viewController = MovieDetailViewControllerSpy()
                sut = MovieDetailPresenter(view: viewController)
                
                genre = Genre(id: 1, name: "Sci-Fi")
                genres = [genre]
                movie = Movie(id: 1,
                              genreIds: [1],
                              title: "Star Wars - The Last Jedi",
                              overview: "Rey develops her newly discovered abilities with the guidance of Luke Skywalker, who is unsettled by the strength of her powers. Meanwhile, the Resistance prepares for battle with the First Order.",
                              releaseDate: Date(),
                              posterPath: "https://www.elastic.co/assets/bltada7771f270d08f6/enhanced-buzz-1492-1379411828-15.jpg")
            }
            
            context("When a movie detail presenter is assigned with a movie detail view controller", closure: {
                
                beforeEach {
                    sut.presentMovie(movie, genres)
                }
                
                it("the controller will display the movie detail ", closure: {
                    expect(viewController.isDisplayMovieDetailCalled).to(beTrue())
                })
                
            })
            
        })
        
        
    }
    
}

class MovieDetailViewControllerSpy: MovieDetailView {
    
    var isDisplayMovieDetailCalled = false
    
    func displayMovieDetail(viewModel: MovieDetailViewController.ViewModel) {
        
        isDisplayMovieDetailCalled = true
        
    }
    
}
