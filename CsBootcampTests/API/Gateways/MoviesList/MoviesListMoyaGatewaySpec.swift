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
        
        fdescribe("MoviesListMoyaGateway") {
            
            let gateway = MoviesListMoyaGateway()
            
            context("when fetch movies") {
                
                let target = MovieTarget.popular
                let host = target.baseURL.host!
                
                stub(condition: isHost(host)) { (request) -> OHHTTPStubsResponse in
                    
                    let path = Bundle(for: MoviesListMoyaGatewaySpec.self).path(forResource: "movies_list", ofType: "json")!
                    return fixture(filePath: path, headers: nil)
                }
                
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
            }
        }
    }
}
