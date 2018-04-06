//
//  FavoritesListViewController.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 03/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class FavoritesListViewController: UIViewController, FavoritesListView {
    
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
        
        view.backgroundColor = .white
        
        setupViewHierarchy()
        setupConstraints()
        
        tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "favorite_empty_icon"), tag: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        searchBarDelegate.textDidChange = setSearchPredicate(_:)
        dataSource.searchDidReturnCount = searchResults
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchFavorites()
    }
    
    func unfavoriteMovie(at index: Int) {
        interactor?.removeFavorite(at: index)
    }
    
    // MARK: Filter
    
    private func setSearchPredicate(_ predicate: String) {
        dataSource.searchPredicate = predicate
    }

    private func searchResults(from predicate: String, didReturnCount count: Int) {

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
