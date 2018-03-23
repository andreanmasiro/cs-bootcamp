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
    
    var interactor: MoviesListInteractorType?
    
    lazy var dataSource = {
        MoviesListDataSource(collectionView: collectionView)
    }()
    
    
    lazy var collectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.sectionInset.left = 16
        flowLayout.sectionInset.right = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
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
        interactor?.fetchMovies()
    }
    
    func setup(state: State) {
        
        switch state {
            
        case .list(let viewModels): dataSource.viewModels = viewModels
        }
    }
    
    func displayMovies(viewModels: [MovieCollectionViewCell.ViewModel]) {
        
        self.setup(state: .list(viewModels))
    }
    
    private func setupViewHierarchy() {
        
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        
        collectionView
            .topAnchor(equalTo: view.topAnchor)
            .bottomAnchor(equalTo: view.bottomAnchor)
            .trailingAnchor(equalTo: view.trailingAnchor)
            .leadingAnchor(equalTo: view.leadingAnchor)
    }
}

extension MoviesListViewController {
    
    enum State {
        
        case list([MovieCollectionViewCell.ViewModel])
    }
}
