//
//  MoviesListDataSource.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class MoviesListDataSource: NSObject, UICollectionViewDataSource {
    
    private unowned let collectionView: UICollectionView
    
    var viewModels: [MovieCollectionViewCell.ViewModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    init(collectionView: UICollectionView) {
        
        self.collectionView = collectionView
        super.init()
        registerCells(in: collectionView)
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    private func registerCells(in collectionView: UICollectionView) {
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "MoviesCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCell", for: indexPath) as? MovieCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        
        cell.setup(viewModel: viewModels[indexPath.item])
        
        return cell
    }
}
