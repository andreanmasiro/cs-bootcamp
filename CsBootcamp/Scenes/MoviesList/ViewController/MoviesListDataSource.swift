//
//  MoviesListDataSource.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

protocol ScrollEventListener: class {
    func didReachToScrollBottom()
}

final class MoviesListDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private weak var collectionView: UICollectionView?
    private weak var indicatorView: UIActivityIndicatorView?
    weak var scrollEventListener: ScrollEventListener?
    
    var didSelectItem: ((Int) -> ())?
    var viewModels: [MovieCollectionViewCell.ViewModel] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    init(collectionView: UICollectionView, indicatorView: UIActivityIndicatorView) {
        
        self.collectionView = collectionView
        self.indicatorView = indicatorView
        super.init()
        registerCells(in: collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }
    
    private func registerCells(in collectionView: UICollectionView) {
        collectionView.register(MovieCollectionViewCell.self)
        collectionView.register(SpinnerMovieListFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter)
    }
    
    // MARK: UICollectionViewDataSource conforms
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(MovieCollectionViewCell.self, for: indexPath)!
        cell.setup(viewModel: viewModels[indexPath.item])
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout conforms
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return MovieCollectionViewCell.cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItem?(indexPath.item)
    }
    
    // MARK: Loading footer
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionFooter:
            
            let footer = collectionView.dequeueReusableSupplementaryView(SpinnerMovieListFooter.self, ofKind: UICollectionElementKindSectionFooter, for: indexPath)!
            
            if let indicatorView = indicatorView {
                footer.setup(activityIndicator: indicatorView)
            }
            return footer
        default:
             return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {

        return CGSize(width: collectionView.bounds.size.width, height: 55)
    }
    
    // MARK: Pagination
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let cellBuffer: CGFloat = 1
        let cellHeight: CGFloat = MovieCollectionViewCell.cellSize.height
        
        let bottomOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let heightBuffer = cellBuffer * cellHeight
        let scrollPosition = scrollView.contentOffset.y
                
        if scrollPosition > bottomOffset - heightBuffer {
            scrollEventListener?.didReachToScrollBottom()
        }
    }
}
