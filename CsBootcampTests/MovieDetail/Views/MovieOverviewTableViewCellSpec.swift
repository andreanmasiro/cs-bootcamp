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
    
    override func spec() {
        
        describe("MovieOverviewTableViewCell", closure:{
            
            var sut: MovieOverviewTableViewCell!
            var viewModel: ViewModel!
            
            beforeSuite {
                
                viewModel = ViewModelBuilder.build()
                sut = MovieOverviewTableViewCell(style: .default, reuseIdentifier: nil)
                
            }
            
            context("when it's initialized", closure: {
                
                it("should setup the view hierarchy ", closure: {
                    expect(sut.contentView.subviews).to(contain([sut.overviewLabel]))
                })
                
            })
            
            context("when cell data is set", closure: {
                
                beforeEach {
                    sut.setup(viewModel: viewModel.overview)
                }
                
                it("should build a cell with correct data", closure: {
                    expect(sut.overviewLabel.text).to(equal(viewModel.overview.overview))
                })
                
            })
            
        })
        
    }
    
}
