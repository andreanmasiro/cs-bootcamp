//
//  MovieOverviewTableViewCellSpec.swift
//  CsBootcampTests
//
//  Created by Gabriel Preto on 28/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MovieOverviewTableViewCellSpec: QuickSpec {
    
    typealias ViewModel = MovieDetailViewController.ViewModel
    typealias PosterViewModel = MoviePosterTableViewCell.ViewModel
    typealias TextViewModel = MovieTextTableViewCell.ViewModel
    typealias OverviewViewModel = MovieOverviewTableViewCell.ViewModel
    
    override func spec() {
        
        describe("MovieOverviewTableViewCell", closure:{
            
            var sut: MovieOverviewTableViewCell!
            var dataSource: MovieDetailDataSource!
            var tableView: UITableView!
            var indexPath: IndexPath!
            var viewModel: ViewModel!
            
            beforeSuite {
                
                viewModel = ViewModelBuilder.build()
                
                tableView = UITableView(frame: .zero)
                dataSource = MovieDetailDataSource(tableView: tableView)
                dataSource.viewModel = viewModel
                
                indexPath = IndexPath(row: 3, section: 0)
                sut = dataSource.tableView(tableView, cellForRowAt: indexPath) as! MovieOverviewTableViewCell
                
            }
            
            context("when it's initialized", closure: {
                
                it("should setup the view hierarchy ", closure: {
                    expect(sut.contentView.subviews).to(contain([sut.overviewLabel]))
                })
                
            })
            
            context("when cell data is set", closure: {
                
                it("should build a cell with correct data", closure: {
                    expect(sut.overviewLabel.text).to(equal(viewModel.overview.overview))
                })
                
            })
            
        })
        
    }
    
}
