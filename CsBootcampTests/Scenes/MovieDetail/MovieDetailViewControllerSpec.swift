//
//  MovieDetailViewControllerSpec.swift
//  CsBootcampTests
//
//  Created by Gabriel Preto on 27/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MovieDetailViewControllerSpec: QuickSpec {
    
    typealias ViewModel = MovieDetailViewController.ViewModel
    typealias PosterViewModel = MoviePosterTableViewCell.ViewModel
    typealias TextViewModel = MovieTextTableViewCell.ViewModel
    typealias OverviewViewModel = MovieOverviewTableViewCell.ViewModel
    
    override func spec() {
        
        describe("MovieDetailViewController") {
            
            var sut: MovieDetailViewController!
            context("when it is initialized") {
                
                
                let movie = Movie(id: 0, genreIds: [], title: "", overview: "", releaseDate: Date(), posterPath: "")
                
                beforeEach {
                    sut = MovieDetailViewController(movie: movie)
                }
                
                it("should setup the view hierarchy") {
                    expect(sut.view.subviews).to(contain(sut.tableView))
                }
                
                context("and display movie detail is called") {
                    
                    let viewModel = MovieDetailViewController.ViewModel(
                        poster: MoviePosterTableViewCell.ViewModel(
                            imageURL: URL(string: "url.com")!,
                            title: "",
                            isFavoriteImage: UIImage()
                        ),
                        releaseDate: MovieTextTableViewCell.ViewModel(description: ""),
                        genres: MovieTextTableViewCell.ViewModel(description: ""),
                        overview: MovieOverviewTableViewCell.ViewModel(overview: "")
                    )
                    
                    beforeEach {
                        sut.displayMovieDetail(viewModel: viewModel)
                    }
                    
                    it("should set the data source view model") {
                        expect(sut.dataSource.viewModel).to(equal(viewModel))
                    }
                }
                
                context("and view will appear") {
                    
                    var interactor: MovieDetailInteractorSpy!
                    
                    beforeEach {
                        interactor = MovieDetailInteractorSpy()
                        sut.interactor = interactor
                        sut.beginAppearanceTransition(true, animated: false)
                        sut.endAppearanceTransition()
                    }
                    
                    it("the interactor should call the fetch movie method") {
                        expect(interactor.isFetchDetailOfMovieCalled).to(beTrue())
                    }
                }
            }
            
            context("when it is initialized with coder") {
                
                beforeEach {
                    let coder = NSCoder()
                    sut = MovieDetailViewController(coder: coder)
                }
                
                it("should be nil") {
                    expect(sut).to(beNil())
                }
            }
        }
    }
}

class MovieDetailInteractorSpy: MovieDetailInteractorType {
    
    var isFetchDetailOfMovieCalled = false
    
    func fetchDetail(of movie: Movie) {
        
        isFetchDetailOfMovieCalled = true
    }
}


