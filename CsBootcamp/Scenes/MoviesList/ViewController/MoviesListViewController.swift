//
//  MoviesListViewController.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class MoviesListViewController: UIViewController, MoviesListView, ShowMovieDetailNavigator, ScrollNotification {

    private var page = 1
    private var state: State = .list([])
    
    lazy var errorView: MovieListErrorView = {
       
        let errorView = MovieListErrorView()
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.isHidden = true
        
        return errorView
    }()
    
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

    lazy var dataSource: MoviesListDataSource = {

        let dataSource = MoviesListDataSource(collectionView: collectionView)
        dataSource.didSelectItem = self.movieSelected
        
        return dataSource
    }()

    var listInteractor: MoviesListInteractorType?
    var showDetailInteractor: MoviesListShowDetailInteractorType?

    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    init() {

        super.init(nibName: nil, bundle: nil)
        title = "Movies"
        
        dataSource.scrollNotificationDelegate = self
        setupViewHierarchy()
        setupConstraints()

        view.backgroundColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchMovies(at: page)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        page = 1
    }
    
    func didArriveScrollEnd() {
        
        if case .list = state {
            page += 1
            fetchMovies(at: page)
            collectionView.reloadData()
        }
    }

    private func fetchMovies(at page: Int) {

        setup(state: .loading)
        listInteractor?.fetchMovies(page: page)
    }
    
    private func movieSelected(at index: Int) {
        
        if let movie = listInteractor?.movie(at: index) {
            self.showDetailInteractor?.showDetail(forMovie: movie)
        }
    }
    
    // MARK: MoviesListView conforms

    func displayMovies(viewModel: MoviesListViewModel) {

        setup(state: .list(viewModel.cellViewModels))
    }
    
    func displayError(viewModel: MoviesListErrorViewModel) {
        
        setup(state: .error(viewModel))
    }
    
    // MARK: ShowMovieDetailNavigator conforms
    
    func navigate(toDetailOf movie: Movie) {
        let vc = MovieDetailSceneFactory.make(with: movie)
        show(vc, sender: nil)
    }

    // MARK: Setups

    private func setup(state: State) {

        self.state = state
        if case let .list(viewModels) = state {

            dataSource.viewModels = viewModels
        } else if case let .error(viewModel) = state {
            
            errorView.setup(viewModel: viewModel)
        }

        collectionView.isHidden = state.hidesCollectionView
        activityIndicator.setAnimating(state.animatesActivityIndicator)
        errorView.isHidden = state.hidesErrorView
    }

    private func setupViewHierarchy() {

        view.addSubview(collectionView)
        view.addSubview(activityIndicator)
        view.addSubview(errorView)
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
        
        errorView
            .topAnchor(equalTo: view.topAnchor)
            .bottomAnchor(equalTo: view.bottomAnchor)
            .trailingAnchor(equalTo: view.trailingAnchor)
            .leadingAnchor(equalTo: view.leadingAnchor)
    }
}

extension MoviesListViewController {

    enum State {

        case list([MovieCollectionViewCell.ViewModel])
        case loading
        case error(MoviesListErrorViewModel)

        var hidesCollectionView: Bool {

            switch self {
            case .list: return false
            case .loading, .error: return true
            }
        }

        var hidesErrorView: Bool {
            
            switch self {
                
            case .error: return false
            case .list, .loading: return true
            }
        }
        
        var animatesActivityIndicator: Bool {

            switch self {
            case .loading: return true
            case .list, .error: return false
            }
        }
    }
}
