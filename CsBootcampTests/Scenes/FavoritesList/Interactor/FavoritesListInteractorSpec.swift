//
//  FavoritesListInteractorSpec.swift
//  CsBootcampTests
//
//  Created by Gabriel Preto on 06/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class FavoritesListInteractorSpec: QuickSpec {
    
    override func spec() {
        
        describe("FavoritesListInteractor") {
            
            var presenter: FavoritesListPresenterSpy!
            var gateway: FavoriteMoviesListGatewayStub!
            var sut: FavoritesListInteractor!
            
            context("when it's initialized") {
                
                beforeEach {
                    presenter = FavoritesListPresenterSpy()
                    gateway = FavoriteMoviesListGatewayStub()
                    sut = FavoritesListInteractor(presenter: presenter, favoriteMoviesListGateway: gateway)
                }
                
                context("and result is failure") {
                    
                    beforeEach {
                        let error = NSError(domain: "", code: 0, userInfo: nil) as Error
                        gateway.result = .failure(error)
                        
                    }
                    
                    context("and fetch movies is called") {
                        
                        beforeEach {
                            sut.fetchFavorites()
                        }
                        
                        it("should not call present favorites") {
                            
                            expect(presenter.isPresentFavoriteCalled).to(beFalse())
                        }
                    }
                }
                
                context("and result is success") {
                    
                    beforeEach {
                        gateway.result = .success([])
                    }
                    
                    context("and fetch movies is called") {
                        
                        beforeEach {
                            sut.fetchFavorites()
                        }
                        
                        it("should call present favorites") {
                            
                            expect(presenter.isPresentFavoriteCalled).to(beTrue())
                        }
                    }
                }
            }
        }
    }
}

final class FavoritesListPresenterSpy: FavoritesListPresenterType {
    
    var isPresentFavoriteCalled = false
    
    func presentFavorites(_ movies: [Movie]) {
        
        isPresentFavoriteCalled = true
    }
}


