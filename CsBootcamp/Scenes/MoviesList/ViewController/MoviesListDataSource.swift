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
    
    private unowned let collectionView: UICollectionView
    private let cellBuffer: CGFloat = 2
    private let cellHeight: CGFloat = MovieCollectionViewCell.cellSize.height
    private let moviesToAdd = 20
    
    weak var scrollNotificationDelegate: ScrollNotification?
    
    var didSelectItem: ((Int) -> ())?
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
    
    // Mark: Pagination
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let top: CGFloat = 0
        let bottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height
        let buffer: CGFloat = cellBuffer * cellHeight
        let scrollPosition = scrollView.contentOffset.y
        
        if scrollPosition > bottom - buffer {
            scrollNotificationDelegate?.didArriveScrollEnd()
            collectionView.contentOffset.y -= CGFloat(moviesToAdd) * cellHeight
        }
        else if  scrollPosition < top + buffer {
            // Add more dates to the top
        }
    }
}









