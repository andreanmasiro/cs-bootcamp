//
//  MovieCollectionViewCellSpec.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble
import Kingfisher

@testable import CsBootcamp

class MovieCollectionViewCellSpec: QuickSpec {
    
    override func spec() {
        
        describe("MovieCollectionViewCell") {
            
            var cell: MovieCollectionViewCell!
            
            context("when initialized with coder") {
                
                beforeEach {
                    let coder = NSCoder()
                    cell = MovieCollectionViewCell(coder: coder)
                }
                
                it("should be nil") {
                    expect(cell).to(beNil())
                }
            }
            
            context("when initialized") {
                
                beforeEach {
                    cell = MovieCollectionViewCell(frame: .zero)
                }
                
                it("should setup the view hierarchy") {
                    expect(cell.contentView.subviews).to(contain([cell.titleLabel, cell.imageView]))
                }
                
                it("should set the content view background color") {
                    expect(cell.contentView.backgroundColor).to(equal(UIColor.Bootcamp.darkBlue))
                }
                
                context("and setup") {
                    
                    let viewModel = MovieCollectionViewCell.ViewModel(
                        imageURL: URL(string: "image.com")!,
                        title: "title",
                        favoriteButtonImage: UIImage()
                    )
                    
                    beforeEach {
                        cell.setup(viewModel: viewModel)
                    }
                    
                    it("should set label text") {
                        expect(cell.titleLabel.text).to(equal(viewModel.title))
                    }
                    
                    it("should config imageview fetch") {
                        expect(cell.imageView.kf.webURL).to(be(viewModel.imageURL))
                    }
                }
            }
        }
    }
}
