//
//  MovieTextTableViewCellSpec.swift
//  CsBootcampTests
//
//  Created by Lucas Nascimento on 28/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MovieTextTableViewCellSpec: QuickSpec {
    
    override func spec() {
        
        typealias ViewModel = MovieDetailViewController.ViewModel
        
        describe("MovieTextTableViewCell") {
        
            var sutReleaseDate : MovieTextTableViewCell!
            var sutRGenres : MovieTextTableViewCell!
            var tableView: UITableView!
            var viewModel: ViewModel!
            var dataSource: MovieDetailDataSource!
            var indexPathRow_1: IndexPath!
            var indexPathRow_2: IndexPath!
            
            beforeSuite {
        
                viewModel = ViewModelBuilder.build()
                tableView = UITableView(frame: .zero)
                indexPathRow_1 = IndexPath(row: 1, section: 0)
                indexPathRow_2 = IndexPath(row: 2, section: 0)
                dataSource = MovieDetailDataSource(tableView: tableView)
                dataSource.viewModel = viewModel
                
                sutReleaseDate = dataSource.tableView(tableView, cellForRowAt: indexPathRow_1) as! MovieTextTableViewCell
                sutRGenres = dataSource.tableView(tableView, cellForRowAt: indexPathRow_2) as! MovieTextTableViewCell
                
            }
            context("When is initialized", closure: {
                it("Should call setupViewHierarchy  method", closure: {
                    expect(sutReleaseDate.contentView.subviews).to(contain(sutReleaseDate.textLabelCell))
                })
            })
            
            context("When setup method is called", closure: {
                it("Should set releaseDate value for  UILabel", closure: {
                    expect(sutReleaseDate.textLabelCell.text).to(equal(viewModel.releaseDate.description))
                })
                
                it("Should set genres value for  UILabel", closure: {
                    expect(sutRGenres.textLabelCell.text).to(equal(viewModel.genres.description))
                })
            })
            
        }
    }
    
}


