//
//  MovieSpec.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MovieSpec: QuickSpec {
    
    override func spec() {
        
        describe("Movie") {
            
            context("when initialized from json") {
                
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let bundle = Bundle(for: MovieSpec.self)
                
                context("when json is valid") {
                    
                    let fixtureUrl = bundle.url(forResource: "movie_valid", withExtension: "json")!
                    let jsonData = try! Data(contentsOf: fixtureUrl)
                    
                    it("should parse correctly") {
                        expect {
                            try decoder.decode(Movie.self, from: jsonData)
                        }.notTo(throwError())
                    }
                }
                
                context("when json is invalid") {
                    
                    let fixtureUrl = bundle.url(forResource: "movie_invalid", withExtension: "json")!
                    let jsonData = try! Data(contentsOf: fixtureUrl)
                    
                    it("should throw error") {
                        
                        expect {
                            try decoder.decode(Movie.self, from: jsonData)
                        }.to(throwError())
                    }
                }
            }
            
            context("when initialized") {
                
                let id = 0
                let genreIds = [1, 2]
                let title = "title"
                let overview = "overview"
                let releaseDate = Date()
                let posterPath = "/poster"
                
                let movie = Movie(id: id, genreIds: genreIds, title: title, overview: overview, releaseDate: releaseDate, posterPath: posterPath)
                it("should store values correctly") {
                    
                    expect(movie.id) == id
                    expect(movie.genreIds) == genreIds
                    expect(movie.title) == title
                    expect(movie.overview) == overview
                    expect(movie.releaseDate) == releaseDate
                    expect(movie.posterPath) == posterPath
                }
            }
        }
    }
}
