//
//  MoviesListDataSource.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

protocol ScrollNotification: class {
    func didArriveScrollEnd()
}

final class MoviesListDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private weak var collectionView: UICollectionView?
    
    weak var scrollNotificationDelegate: ScrollNotification?
    
    var didSelectItem: ((Int) -> ())?
    var viewModels: [MovieCollectionViewCell.ViewModel] = [] {
        didSet {
            collectionView?.reloadData()
        }
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
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(MovieCollectionViewCell.self, for: indexPath)!
        cell.setup(viewModel: viewModels[indexPath.item])
        
        return cell
    }
    
    // Mark: UICollectionViewDelegateFlowLayout conforms
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return MovieCollectionViewCell.cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItem?(indexPath.item)
    }
    
    // MARK: Pagination
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let cellBuffer: CGFloat = 1
        let cellHeight: CGFloat = MovieCollectionViewCell.cellSize.height
        
        let bottomOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let heightBuffer = cellBuffer * cellHeight
        let scrollPosition = scrollView.contentOffset.y
        
        if scrollPosition > bottomOffset - heightBuffer {
            scrollNotificationDelegate?.didArriveScrollEnd()
        }
    }
}
