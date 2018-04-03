//
//  MoviesListDataSource.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class MoviesListDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private unowned let collectionView: UICollectionView
    
    var didSelectItem: ((Int) -> ())?
    var searchDidReturnCount: ((String, Int) -> ())?
    var searchPredicate: String = "" {
        didSet {
            if oldValue != searchPredicate {
                collectionView.reloadData()
            }
        }
    }
    
    var viewModels: [MovieCollectionViewCell.ViewModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private var filteredViewModels: [MovieCollectionViewCell.ViewModel] {
        
        let viewModels = searchPredicate.isEmpty ?
            self.viewModels :
            self.viewModels.filter({ viewModel in
                viewModel.title.lowercased().contains(self.searchPredicate.lowercased())
            })
        
        searchDidReturnCount?(searchPredicate, viewModels.count)
        
        return viewModels
    }
    
    init(collectionView: UICollectionView) {
        
        self.collectionView = collectionView
        super.init()
        registerCells(in: collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }
    
    private func registerCells(in collectionView: UICollectionView) {
        collectionView.register(MovieCollectionViewCell.self)
    }
    
    // Mark: UICollectionViewDataSource conforms
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(MovieCollectionViewCell.self, for: indexPath)!
        cell.setup(viewModel: filteredViewModels[indexPath.item])
        
        return cell
    }
    
    // Mark: UICollectionViewDelegateFlowLayout conforms
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return MovieCollectionViewCell.cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItem?(indexPath.item)
    }
}
