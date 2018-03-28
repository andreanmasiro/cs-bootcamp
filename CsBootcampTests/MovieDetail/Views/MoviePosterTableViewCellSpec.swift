//
//  MoviePosterTableViewCellSpec.swift
//  CsBootcampTests
//
//  Created by Gabriel Preto on 28/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MoviePosterTableViewCellSpec: QuickSpec {
    
    typealias ViewModel = MovieDetailViewController.ViewModel
    typealias PosterViewModel = MoviePosterTableViewCell.ViewModel
    typealias TextViewModel = MovieTextTableViewCell.ViewModel
    typealias OverviewViewModel = MovieOverviewTableViewCell.ViewModel
    
    override func spec() {
        
        describe("MoviePosterTableViewCell", closure:{
            
            var sut: MoviePosterTableViewCell!
            var dataSource: MovieDetailDataSource!
            var tableView: UITableView!
            var indexPath: IndexPath!
            var viewModel: ViewModel!
            var cell: MoviePosterTableViewCell!
            
            beforeSuite {
                viewModel = ViewModelBuilder.build()
                
                tableView = UITableView(frame: .zero)
                dataSource = MovieDetailDataSource(tableView: tableView)
                dataSource.viewModel = viewModel
                
                indexPath = IndexPath(row: 0, section: 0)
                sut = dataSource.tableView(tableView, cellForRowAt: indexPath) as! MoviePosterTableViewCell
                
            }
            
            context("when it's initialized", closure: {
    
                it("should setup the view hierarchy ", closure: {
                    expect(sut.contentView.subviews).to(contain([sut.titleLabel, sut.posterImageView]))
                })
                
            })
            
            context("When is initialized with coder", {
                
                beforeEach {
                    let coder = NSCoder()
                    cell = MoviePosterTableViewCell(coder: coder)
                }
                
                it("should be nil", closure: {
                    expect(cell).to(beNil())
                })
            })
            
            context("when cell data is set", closure: {

                it("should build a cell with correct data", closure: {
                    expect(sut.titleLabel.text).to(equal(viewModel.poster.title))
                })
                
            })
            
        })
        
    }
    
}
