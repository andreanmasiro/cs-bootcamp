//
//  MoviesListViewControllerSpec.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MoviesListViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        describe("MoviesListViewController") {
            
            var viewController: MoviesListViewController!
            
            context("when initialized") {
                
                context("with coder") {
                    
                    beforeEach {
                        let coder = NSCoder()
                        viewController = MoviesListViewController(coder: coder)
                    }
                    
                    it("should be nil") {
                        expect(viewController).to(beNil())
                    }
                }
                
                beforeEach {
                    viewController = MoviesListViewController()
                }
                
                it("should set the title") {
                    expect(viewController.title).to(match("Movies"))
                }
                
                it("should setup the view hierarchy") {
                   
                    let expectedSubviews: [UIView] = [
                        viewController.collectionView,
                        viewController.activityIndicator,
                        viewController.errorView
                    ]
                    expect(viewController.view.subviews)
                        .to(contain(expectedSubviews))
                }
            }
            
            context("when view will appear") {
                
                let interactor = MoviesListInteractorSpy()
                
                beforeEach {
                    viewController = MoviesListViewController()
                    viewController.interactor = interactor
                    viewController.beginAppearanceTransition(true, animated: false)
                    viewController.endAppearanceTransition()
                }
                
                it("should change to loading state") {
                    
                    expect(viewController.activityIndicator.isAnimating)
                        .to(beTrue())
                }
                
                it("should fetch movies") {
                    
                    expect(interactor.fetchMoviesCalled).to(beTrue())
                }
            }
            
            context("when display movies is called") {
                
                let viewModel = MoviesListViewModel(cellViewModels: (0..<3).map { _ in
                    MovieCollectionViewCell.ViewModel(
                        imageURL: URL(string: "url.com")!,
                        title: ""
                    )
                })
                beforeEach {
                    
                    viewController = MoviesListViewController()
                    viewController.displayMovies(viewModel: viewModel)
                }
                
                it("should change to list state") {
                    
                    expect(viewController.collectionView.isHidden).to(beFalse())
                }
                
                it("should set viewmodels to data source") {
                    
                    expect(viewController.dataSource.viewModels)
                        .to(equal(viewModel.cellViewModels))
                }
            }
            
            context("when display error is called") {
                
                let errorViewModel = MoviesListErrorViewModel()
                
                beforeEach {
                    
                    viewController = MoviesListViewController()
                    viewController.displayError(viewModel: errorViewModel)
                }
                
                it("should change to error state") {
                    
                    expect(viewController.errorView.isHidden).to(beFalse())
                }
                
                it("should setup error view") {
                    
                    expect(viewController.errorView.imageView.image)
                        .to(equal(errorViewModel.image))
                    expect(viewController.errorView.label.text)
                        .to(match(errorViewModel.message))
                }
            }
            
            describe("State") {
                
                var state: MoviesListViewController.State!
                
                context("list") {
                    
                    beforeEach {
                        state = .list([])
                    }
                    
                    it("should return collection view not hidden flag") {
                        expect(state.hidesCollectionView).to(beFalse())
                    }
                    
                    it("should return error view hidden flag") {
                        expect(state.hidesErrorView).to(beTrue())
                    }
                    
                    it("should return not animates activity indicator") {
                        expect(state.animatesActivityIndicator).to(beFalse())
                    }
                }
                
                context("loading") {
                    
                    beforeEach {
                        state = .loading
                    }
                    
                    it("should return collection view hidden flag") {
                        expect(state.hidesCollectionView).to(beTrue())
                    }
                    
                    it("should return error view hidden flag") {
                        expect(state.hidesErrorView).to(beTrue())
                    }
                    
                    it("should return animates activity indicator") {
                        expect(state.animatesActivityIndicator).to(beTrue())
                    }
                }
                
                context("error") {
                    
                    beforeEach {
                        let errorViewModel = MoviesListErrorViewModel()
                        state = .error(errorViewModel)
                    }
                    
                    it("should return collection view hidden flag") {
                        expect(state.hidesCollectionView).to(beTrue())
                    }
                    
                    it("should return error view not hidden flag") {
                        expect(state.hidesErrorView).to(beFalse())
                    }
                    
                    it("should return not animates activity indicator") {
                        expect(state.animatesActivityIndicator).to(beFalse())
                    }
                }
            }
        }
    }
}

class MoviesListInteractorSpy: MoviesListInteractorType {
    
    var fetchMoviesCalled = false
    
    func fetchMovies() {
        fetchMoviesCalled = true
    }
}