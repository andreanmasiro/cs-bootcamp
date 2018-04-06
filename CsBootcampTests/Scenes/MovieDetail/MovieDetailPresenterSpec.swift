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
        
        describe("MovieDetailPresenter") {
            
            var viewController: MovieDetailViewControllerSpy!
            var sut: MovieDetailPresenter!
            
            context("when it is initialized") {
                
                beforeEach {
                    viewController = MovieDetailViewControllerSpy()
                    sut = MovieDetailPresenter(view: viewController)
                }
                
                context("and present movie is called") {
                    
                    let response = FetchMovieDetailResponse(posterPath: "", releaseDate: Date(), title: "", overview: "", isFavorite: true, genreNames: [])
                    
                    beforeEach {
                        sut.presentMovie(response: response)
                    }
                    
                    it("should display movie detail") {
                        expect(viewController.isDisplayMovieDetailCalled).to(beTrue())
                    }
                }
            }
        }
    }
}

class MovieDetailViewControllerSpy: MovieDetailView {
    
    var isDisplayMovieDetailCalled = false
    
    func displayMovieDetail(viewModel: MovieDetailViewController.ViewModel) {
        
        isDisplayMovieDetailCalled = true
        
    }
    
}
