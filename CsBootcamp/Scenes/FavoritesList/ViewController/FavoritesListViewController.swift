//
//  FavoritesListViewController.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 03/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class FavoritesListViewController: UIViewController, FavoritesListView {
    
    private var filteringGenre: Genre?
    private var filteringReleaseYear: Int?
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.allowsMultipleSelectionDuringEditing = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.estimatedSectionHeaderHeight = 1
        
        return tableView
    }()
    
    lazy var searchBar: UISearchBar = {
        
        let searchBar = UISearchBar(frame: .zero)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.barTintColor = UIColor.Bootcamp.yellow
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.Bootcamp.yellow.cgColor
        searchBar.placeholder = "Search"
        
        return searchBar
    }()
    
    lazy var searchBarDelegate: SearchBarDelegate = {
        
        let searchBarDelegate = SearchBarDelegate(searchBar: searchBar)
        return searchBarDelegate
    }()
    
    var interactor: FavoritesListInteractorType?
    
    lazy var dataSource: FavoritesListDataSource = {
       
        let dataSource = FavoritesListDataSource(tableView: tableView)
        dataSource.didUnfavoriteItemAtIndex = unfavoriteMovie
        
        return dataSource
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Favorites"
        
        tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "favorite_empty_icon"), tag: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        
        searchBarDelegate.textDidChange = setSearchPredicate
        
        view.backgroundColor = .white
        
        setupViewHierarchy()
        setupConstraints()
        
        let rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "filter_icon"), style: .plain, target: self, action: #selector(rightBarButtonAction))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchFavorites(filteringWithGenre: filteringGenre, releaseYear: filteringReleaseYear)
    }
    
    func unfavoriteMovie(at index: Int) {
        interactor?.removeFavorite(at: index)
    }
    
    @objc func rightBarButtonAction(sender: UIBarButtonItem) {
        
        let moviesFilterViewController = MoviesFilterSceneFactory.make(applyFilter: applyFilter)
        show(moviesFilterViewController, sender: nil)
    }
    
    // MARK: Filter
    
    private func setSearchPredicate(_ predicate: String) {
        dataSource.searchPredicate = predicate
    }
    
    private func applyFilter(withGenre genre: Genre?, releaseYear: Int?) {
        filteringGenre = genre
        filteringReleaseYear = releaseYear
    }
    
    // MARK: FavoritesListView Protocol
    
    func displayFavorites(viewModels: [FavoriteTableViewCell.ViewModel]) {
        
        setup(state: .list(viewModels))
    }
    
    
    // MARK: Setups
    
    private func setup(state: State) {
        
        if case let .list(viewModels) = state {
            dataSource.viewModels = viewModels
        }
    }
    
    private func setupViewHierarchy() {
        
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        searchBar
            .topAnchor(equalTo: view.topAnchor)
            .heightAnchor(equalTo: 48.0)
            .leadingAnchor(equalTo: view.leadingAnchor)
            .trailingAnchor(equalTo: view.trailingAnchor)
        
        tableView
            .topAnchor(equalTo: searchBar.bottomAnchor)
            .bottomAnchor(equalTo: view.bottomAnchor)
            .trailingAnchor(equalTo: view.trailingAnchor)
            .leadingAnchor(equalTo: view.leadingAnchor)
    }
}

extension FavoritesListViewController {
    
    enum State {
        case list([FavoriteTableViewCell.ViewModel])
    }
    
}
