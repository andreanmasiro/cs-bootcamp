//
//  MovieDetailSceneFactorySpec.swift
//  CsBootcampTests
//
//  Created by Lucas Nascimento on 02/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MovieDetailSceneFactorySpec: QuickSpec {
    
    override func spec() {
        
        describe("MovieDetailSceneFactory") {
   
            var viewController: MovieDetailViewController!
            
            context("when make method is called", {

                let movie = Movie(id: 0, genreIds: [], title: "", overview: "", releaseDate: Date(), posterPath: "")
                
                beforeEach {
                    viewController = MovieDetailSceneFactory.make(with: movie) as? MovieDetailViewController
                }
                
                it("should return a instance of UIViewController", closure: {
                    expect(viewController).toNot(beNil())
                })
            })
        }
    }
}
