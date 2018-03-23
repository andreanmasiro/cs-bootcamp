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

final class MoviesListViewController: UIViewController {
    
    unowned let collectionView: UICollectionView = {
        
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    lazy var dataSource = {
        MoviesListDataSource(collectionView: collectionView)
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var interactor: MoviesListInteractorType?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
//        interactor.fetchMovies()
    }
    
    func setup(state: State) {
        
    }
    
    func displayMovies(viewModels: [MovieCollectionViewCell.ViewModel]) {
        
        self.setup(state: .list(viewModels))
    }
    
    private func setupViewHierarchy() {
        
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        
        // todo: constraints
    }
}

extension MoviesListViewController {
    
    enum State {
        
        case list([MovieCollectionViewCell.ViewModel])
    }
}
