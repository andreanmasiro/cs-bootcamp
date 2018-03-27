//
//  MoviesListViewController.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

protocol MoviesListInteractorType {
    
    func fetchMovies()
}

final class MoviesListViewController: UIViewController, MoviesListView {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        return activityIndicator
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        let margin = CGFloat(16).proportionalToWidth
        flowLayout.sectionInset = UIEdgeInsets(
            top: margin,
            left: margin,
            bottom: margin,
            right: margin
        )
        
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    lazy var dataSource = {
        
        MoviesListDataSource(collectionView: collectionView)
    }()
    
    var interactor: MoviesListInteractorType?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
        title = "Movies"
        
        setupViewHierarchy()
        setupConstraints()
        
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        fetchMovies()
    }
    
    private func fetchMovies() {
        
        interactor?.fetchMovies()
        setup(state: .loading)
    }
    
    // MARK: MoviesListView conforms
    
    func displayMovies(viewModels: [MovieCollectionViewCell.ViewModel]) {
        
        setup(state: .list(viewModels))
    }
    
    // MARK: Setups
    
    private func setup(state: State) {
        
        if case let .list(viewModels) = state {
            
            dataSource.viewModels = viewModels
        }
        
        collectionView.isHidden = state.hidesCollectionView
        state.activityIndicatorAction(activityIndicator)()
    }
    
    private func setupViewHierarchy() {
        
        view.addSubview(collectionView)
        view.addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        
        collectionView
            .topAnchor(equalTo: view.topAnchor)
            .bottomAnchor(equalTo: view.bottomAnchor)
            .trailingAnchor(equalTo: view.trailingAnchor)
            .leadingAnchor(equalTo: view.leadingAnchor)
        
        activityIndicator
            .centerXAnchor(equalTo: view.centerXAnchor)
            .centerYAnchor(equalTo: view.centerYAnchor)
    }
}

extension MoviesListViewController {
    
    enum State {
        
        case list([MovieCollectionViewCell.ViewModel])
        case loading
        
        var hidesCollectionView: Bool {
            
            switch self {
            case .list: return false
            case .loading: return true
            }
        }
        
        var activityIndicatorAction: (UIActivityIndicatorView) -> () -> () {
            
            switch self {
            case .list: return UIActivityIndicatorView.stopAnimating
            case .loading: return UIActivityIndicatorView.startAnimating
            }
        }
    }
}
