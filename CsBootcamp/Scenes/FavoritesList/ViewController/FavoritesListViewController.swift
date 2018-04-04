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
    
    var interactor: FavoritesListInteractorType?
    
    lazy var dataSource: FavoritesListDataSource = {
       
        let dataSource = FavoritesListDataSource(tableView: tableView)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor?.fetchFavorites()
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
        
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        tableView
            .topAnchor(equalTo: view.topAnchor)
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
