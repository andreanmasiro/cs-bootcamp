//
//  MovieDetailDataSourceSpec.swift
//  CsBootcampTests
//
//  Created by Gabriel Preto on 27/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MovieDetailDataSourceSpec: QuickSpec {
    
    typealias ViewModel = MovieDetailViewController.ViewModel
    typealias PosterViewModel = MoviePosterTableViewCell.ViewModel
    typealias TextViewModel = MovieTextTableViewCell.ViewModel
    typealias OverviewViewModel = MovieOverviewTableViewCell.ViewModel
    
    override func spec() {
        
        describe("MovieDetailDataSource") {
            var movie: Movie!
            var genre1: Genre!
            var genre2: Genre!
            var genreId1: Int!
            var genreId2: Int!
            var genres: [Int]!
            var tableView: UITableView!
            var sut: MovieDetailDataSource!
            var cell: UITableViewCell!
            var indexPath: IndexPath!
            var viewModel: ViewModel!
            var posterViewModel: PosterViewModel!
            var releaseDateViewModel: TextViewModel!
            var genresViewModel: TextViewModel!
            var overviewViewModel: OverviewViewModel!
            
            beforeSuite {
                tableView = UITableView(frame: .zero)
                sut = MovieDetailDataSource(tableView: tableView)
                
                viewModel = ViewModelBuilder.build()
                
            }
            
            context("When Datasource is initialized", closure: {
                
                beforeEach {
                    sut.viewModel = viewModel
                }
                
                it("should init the Data Source and store the given view model", closure: {
                    expect(sut).notTo(beNil())
                    expect(sut.viewModel == viewModel).to(beTrue())
                })
            })
            
            context("when number of rows in section is called", closure:{
                
                var rows = 0
                
                beforeEach {
                    rows = sut.tableView(tableView, numberOfRowsInSection: 0)
                }
                
                it("should return 4 rows", closure: {
                    expect(rows).to(equal(4))
                })
                
            })
            
            context("when the poster cell is builded", closure: {
                
                beforeEach {
                    indexPath = IndexPath(row: 0, section: 0)
                    cell = sut.tableView(tableView, cellForRowAt: indexPath) as? MoviePosterTableViewCell
                }
                
                it("should not be nil", closure: {
                    expect(cell).notTo(beNil())
                })
                
            })
            
            context("when the text cell is builded as a release date cell", closure: {
                
                beforeEach {
                    indexPath = IndexPath(row: 1, section: 0)
                    cell = sut.tableView(tableView, cellForRowAt: indexPath) as? MovieTextTableViewCell
                }
                
                it("should not be nil", closure: {
                    expect(cell).notTo(beNil())
                })
            })
            
            context("when the text cell is builded as a genres cell", closure: {
                
                beforeEach {
                    indexPath = IndexPath(row: 2, section: 0)
                    cell = sut.tableView(tableView, cellForRowAt: indexPath) as? MovieTextTableViewCell
                }
                
                it("should not be nil", closure: {
                    expect(cell).notTo(beNil())
                })
            })
            
            context("when the overview cell is builded", closure: {
                
                beforeEach {
                    indexPath = IndexPath(row: 3, section: 0)
                    cell = sut.tableView(tableView, cellForRowAt: indexPath) as? MovieOverviewTableViewCell
                }
                
                it("should not be nil", closure: {
                    expect(cell).notTo(beNil())
                })
                
            })
            
            context("when the heights for row is called", closure: {
                
                it("should return the correct height cell for a poster cell", closure: {
                    indexPath = IndexPath(row: 0, section: 0)
                    let height = sut.tableView(tableView, heightForRowAt: indexPath)
                    expect(height).to(equal(MoviePosterTableViewCell.cellSize))
                })
                
                it("should return the correct height cell for a release date cell", closure: {
                    indexPath = IndexPath(row: 1, section: 0)
                    let height = sut.tableView(tableView, heightForRowAt: indexPath)
                    expect(height).to(equal(MovieTextTableViewCell.cellSize))
                })
                
                it("should return the correct height cell for a genres cell", closure: {
                    indexPath = IndexPath(row: 2, section: 0)
                    let height = sut.tableView(tableView, heightForRowAt: indexPath)
                    expect(height).to(equal(MovieTextTableViewCell.cellSize))
                })
                
                it("should return the correct height cell for a overview cell", closure: {
                    indexPath = IndexPath(row: 3, section: 0)
                    let height = sut.tableView(tableView, heightForRowAt: indexPath)
                    expect(height).to(equal(MovieOverviewTableViewCell.cellSize))
                })
                
            })
            
        }
        
    }
    
}
