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
        
        var sut: MovieDetailViewController!
        var presenter: MovieDetailPresenter!
        var viewModel: ViewModel!
        var viewController :MovieDetailViewController!
        
        describe("MovieDetailViewController") {
            
            beforeSuite {
                
                viewModel = ViewModelBuilder.build()
            }
            
            context("when it's initialized", closure: {
                
                beforeEach {
                    sut = MovieDetailViewController()
                    presenter = MovieDetailPresenter(view: sut)
                }
                
                it("should setup the view hierarchy", closure: {
                    expect(sut.view.subviews).to(contain(sut.tableView))
                })
                
            })
            
            context("When is initialized with coder", {
                
                beforeEach {
                    let coder = NSCoder()
                    viewController = MovieDetailViewController(coder: coder)
                }
                
                it("should be nil", closure: {
                    expect(viewController).to(beNil())
                })
            })
            
            context("when display movie detail is called", closure: {
                
                beforeEach {
                    presenter.view.displayMovieDetail(viewModel: viewModel)
                }
            
                it("should set the data source view model", closure: {
                    expect(sut.dataSource.viewModel).to(equal(viewModel))
                })
                
            })
            
            context("when view will appear", closure:{
                
                var interactor: MovieDetailInteractorSpy!
                
                beforeEach {
                    sut = MovieDetailViewController()
                    interactor = MovieDetailInteractorSpy()
                    sut.interactor = interactor
                    sut.beginAppearanceTransition(true, animated: false)
                    sut.endAppearanceTransition()
                }
            
                it("the interactor should call the fetch movie method", closure: {
                    expect(interactor.isFetchMovieCalled).to(beTrue())
                })
            })
        }
    }
}

class MovieDetailInteractorSpy: MovieDetailInteractorType {
    
    var isFetchMovieCalled = false
    
    func fetchMovie() {
        
        isFetchMovieCalled = true
        
    }
}


