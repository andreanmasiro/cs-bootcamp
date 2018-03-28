//
//  MoviesListPresenterSpec.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MoviesListPresenterSpec: QuickSpec {
    
    override func spec() {
        
        var view: MoviesListViewSpy!
        var presenter: MoviesListPresenter!
        
        let setup = {
            view = MoviesListViewSpy()
            presenter = MoviesListPresenter(view: view)
        }
        
        describe("MoviesListPresenter") {
            
            context("when present movies is called") {
                
                let movies = (0..<3).map { id in
                    Movie(id: id, genreIds: [], title: "", overview: "", releaseDate: Date(), posterPath: "")
                }
                
                beforeEach {
                    setup()
                    presenter.presentMovies(movies)
                }
                
                it("should transform into viewmodels and display") {
                    
                    expect(view.displayMoviesCalled).to(beTrue())
                    
                    let viewModel = MoviesListViewModel(cellViewModels: movies.map { movie in
                        MovieCollectionViewCell.ViewModel(
                            imageURL: APIBase.posterImageURL(path: movie.posterPath),
                            title: movie.title
                        )
                    })
                    expect(view.displayMoviesArg).to(equal(viewModel))
                }
            }
            
            context("when present error is called") {
                
                beforeEach {
                    setup()
                    presenter.presentError()
                }
                
                it("should create default viewmodel and display") {
                    
                    expect(view.displayErrorCalled).to(beTrue())
                    expect(view.displayErrorArg)
                        .to(equal(MoviesListErrorViewModel()))
                }
            }
        }
    }
}

class MoviesListViewSpy: MoviesListView {
    
    var displayMoviesCalled = false
    var displayMoviesArg: MoviesListViewModel?
    
    var displayErrorCalled = false
    var displayErrorArg: MoviesListErrorViewModel?
    
    func displayMovies(viewModel: MoviesListViewModel) {
        displayMoviesCalled = true
        displayMoviesArg = viewModel
    }
    
    func displayError(viewModel: MoviesListErrorViewModel) {
        displayErrorCalled = true
        displayErrorArg = viewModel
    }
}

extension MoviesListErrorViewModel: Equatable {
    
    public static func ==(lhs: MoviesListErrorViewModel, rhs: MoviesListErrorViewModel) -> Bool {
        return lhs.image == rhs.image &&
            lhs.message == rhs.message
    }
}

extension MoviesListViewModel: Equatable {
    
    public static func ==(lhs: MoviesListViewModel, rhs: MoviesListViewModel) -> Bool {
        
        return lhs.cellViewModels == rhs.cellViewModels
    }
}

extension MovieCollectionViewCell.ViewModel: Equatable {
    
    public static func ==(lhs: MovieCollectionViewCell.ViewModel, rhs: MovieCollectionViewCell.ViewModel) -> Bool {
        
        return lhs.imageURL == rhs.imageURL &&
            lhs.title == rhs.title
    }
}
