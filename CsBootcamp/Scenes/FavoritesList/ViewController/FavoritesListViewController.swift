//
//  FavoritesListViewController.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 03/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class FavoritesListViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.estimatedSectionHeaderHeight = 1
        
        return tableView
    }()
    
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchFavorites()
    }
    
    private func fetchFavorites() {
        
        let viewModel = FavoriteTableViewCell.ViewModel(posterUrl: URL(string: "https://ia.media-imdb.com/images/M/MV5BMjQ1MzcxNjg4N15BMl5BanBnXkFtZTgwNzgwMjY4MzI@._V1_SY1000_CR0,0,675,1000_AL_.jpg")!, title: "Star Wars - The Last Jedi", releaseDate: "2017", overview: "Rey develops her newly discovered abilities with the guidance of Luke Skywalker, who is unsettled by the strength of her powers. Meanwhile, the Resistance prepares for battle with the First Order.")
        
        let viewModels = [viewModel, viewModel, viewModel]
        
        setup(state: .list(viewModels))
    }
    
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
