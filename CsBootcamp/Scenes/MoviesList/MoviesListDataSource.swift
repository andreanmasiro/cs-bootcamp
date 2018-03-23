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
    }
    
    private func registerCells(in collectionView: UICollectionView) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
}
