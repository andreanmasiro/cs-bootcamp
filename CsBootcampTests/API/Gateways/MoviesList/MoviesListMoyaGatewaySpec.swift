//
//  MoviesListMoyaGatewaySpec.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble
import OHHTTPStubs

@testable import CsBootcamp

class MoviesListMoyaGatewaySpec: QuickSpec {
    
    override func spec() {
        
        describe("MoviesListMoyaGateway") {
        
            let gateway = MoviesListMoyaGateway()

            var stubCount = 0
            
            beforeEach {
                
                let target = MovieTarget.popular
                let host = target.baseURL.host!
                
                stub(condition: isHost(host)) { (request) -> OHHTTPStubsResponse in
                    
                    stubCount += 1
                    let path = Bundle(for: MoviesListMoyaGatewaySpec.self).path(forResource: "movies_list", ofType: "json")!
                    return fixture(filePath: path, headers: nil)
                }
            }
            
            afterEach {
                OHHTTPStubs.removeAllStubs()
            }
            
            context("when fetch movies") {

                var movies: [Movie]?
                
                beforeEach {
                    waitUntil(action: { done in
                        gateway.fetchMovies { result in
                            if case let .success(value) = result {
                                movies = value
                            }
                            done()
                        }
                    })
                }
                
                it("should return a valid MovieList") {
                    expect(movies).toNot(beNil())
                }
                
                context("and fetch movies again") {
                    
                    beforeEach {
                        gateway.fetchMovies { _ in }
                    }
                    
                    it("should fetch from cache") {
                        expect(stubCount).to(equal(1))
                    }
                }
            }
        }
    }
}
