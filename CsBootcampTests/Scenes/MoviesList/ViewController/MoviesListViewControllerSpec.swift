//
//  MoviesListViewControllerSpec.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MoviesListViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        describe("MoviesListViewController") {
            
            var viewController: MoviesListViewController!
            
            context("when initialized") {
                
                beforeEach {
                    viewController = MoviesListViewController()
                }
                
                it("should set the title") {
                    expect(viewController.title).to(match("Movies"))
                }
                
                it("should setup the view hierarchy") {
                   
                    let expectedSubviews: [UIView] = [
                        viewController.collectionView,
                        viewController.activityIndicator,
                        viewController.errorView
                    ]
                    expect(viewController.view.subviews)
                        .to(contain(expectedSubviews))
                }
            }
        }
    }
}
