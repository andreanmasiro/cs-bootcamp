//
//  MoviesListDataSourceSpec.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MoviesListDataSourceSpec: QuickSpec {
    
    override func spec() {
        
        describe("MoviesListDataSource") {
            
            var collectionView: UICollectionView!
            var moviesListDataSource: MoviesListDataSource!
            
            context("when initialized") {
                
                beforeEach {
                    collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
                    moviesListDataSource = MoviesListDataSource(collectionView: collectionView)
                    let viewModels = [
                        MovieCollectionViewCell.ViewModel(imageURL: URL(string: "url.com")!, title: "")
                    ]
                    moviesListDataSource.viewModels = viewModels
                }
                
                it("should register cells in collection view") {
                    
                    let indexPath = IndexPath(item: 0, section: 0)
                    let cell = collectionView.dequeueReusableCell(MovieCollectionViewCell.self, for: indexPath)
                    expect(cell).notTo(beNil())
                }
                
                it("should set itself as datasource and delegate of collection view") {
                    
                    expect(collectionView.dataSource).to(be(moviesListDataSource))
                    expect(collectionView.delegate).to(be(moviesListDataSource))
                }
            }
            
            context("when number of items in section is called") {
                
                let viewModels = [
                    MovieCollectionViewCell.ViewModel(imageURL: URL(string: "url.com")!, title: "")
                ]
                
                beforeEach {
                    collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
                    moviesListDataSource = MoviesListDataSource(collectionView: collectionView)
                    moviesListDataSource.viewModels = viewModels
                }
                
                it("should return viewmodels count") {
                    let numberOfItems = moviesListDataSource
                        .collectionView(collectionView, numberOfItemsInSection: 0)
                    expect(numberOfItems).to(be(viewModels.count))
                }
            }
            
            context("when cell for item at index path is called") {
                
                let viewModels = [
                    MovieCollectionViewCell.ViewModel(imageURL: URL(string: "url.com")!, title: "title")
                ]
                
                beforeEach {
                    collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
                    moviesListDataSource = MoviesListDataSource(collectionView: collectionView)
                    moviesListDataSource.viewModels = viewModels
                }
                
                it("should return a configured movie cell") {
                    let index = 0
                    let indexPath = IndexPath(item: index, section: 0)
                    let cell = moviesListDataSource.collectionView(collectionView, cellForItemAt: indexPath) as? MovieCollectionViewCell
                    
                    expect(cell?.titleLabel.text).to(equal(viewModels[index].title))
                }
            }
            
            context("when size for cell at index path is called") {
            
                beforeEach {
                    collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
                    moviesListDataSource = MoviesListDataSource(collectionView: collectionView)
                }
                
                it("should return movie collection view cell size") {
                    let indexPath = IndexPath(item: 0, section: 0)
                    let cellSize = moviesListDataSource.collectionView(collectionView, layout: collectionView.collectionViewLayout, sizeForItemAt: indexPath)
                    
                    expect(cellSize).to(equal(MovieCollectionViewCell.cellSize))
                }
            }
        }
    }
}
