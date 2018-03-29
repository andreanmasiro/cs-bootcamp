//
//  MovieListErrorViewSpec.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MovieListErrorViewSpec: QuickSpec {
    
    override func spec() {
        
        describe("MovieListErrorView") {
            
            var errorView: MovieListErrorView!
            
            context("when initialized") {
                
                beforeEach {
                    errorView = MovieListErrorView(frame: .zero)
                }
                
                it("should setup the view hierarchy") {
                    expect(errorView.subviews).to(contain(
                        [errorView.label, errorView.imageView]
                    ))
                }
                
                context("and setup") {
                    
                    let viewModel = MoviesListErrorViewModel(image: UIImage(), message: "message")
                    
                    beforeEach {
                        errorView.setup(viewModel: viewModel)
                    }
                    
                    it("should set image") {
                        expect(errorView.imageView.image).to(equal(viewModel.image))
                    }
                    
                    it("should set label text") {
                        expect(errorView.label.text).to(equal(viewModel.message))
                    }
                }
            }
            
            context("when initialized with coder") {
                
                beforeEach {
                    errorView = MovieListErrorView(coder: NSCoder())
                }
                
                it("should be nil") {
                    expect(errorView).to(beNil())
                }
            }
        }
    }
}
