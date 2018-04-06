//
//  GenresListMoyaGatewaySpec.swift
//  CsBootcampTests
//
//  Created by Gabriel Preto on 29/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble
import OHHTTPStubs

@testable import CsBootcamp

class GenresListMoyaGatewaySpec: QuickSpec {

    override func spec() {

        describe("GenresListMoyaGateway") {

            let gateway = GenresListMoyaGateway()
            
            beforeEach {
                
                let target = GenreTarget.list
                let host = target.baseURL.host!
                
                stub(condition: isHost(host)) { (request) -> OHHTTPStubsResponse in
                    let path = Bundle(for: GenresListMoyaGatewaySpec.self).path(forResource: "genres_list", ofType: "json")!
                    return fixture(filePath: path, headers: nil)
                }
            }
            
            afterEach {
                OHHTTPStubs.removeAllStubs()
            }

            context("when fetch movie genres") {
            
                var genres: [Genre]?

                beforeEach {
                    waitUntil(action: { done in
                        gateway.fetchGenres { result in

                            if case let .success(value) = result {
                                genres = value
                            }
                            done()
                        }
                    })
                }

                it("should return a valid GenreList") {
                    expect(genres).toNot(beNil())
                }
            }
        }
    }
}


