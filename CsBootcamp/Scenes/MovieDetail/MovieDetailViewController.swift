//
//  MovieDetailViewController.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 23/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

protocol MovieDetailInteractorType {
    
    func fetchMovie()
}

final class MovieDetailViewController: UIViewController, MovieDetailView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorInset.left = 0
        tableView.separatorInset.right = 0
        
        return tableView
    }()
    
    var interactor: MovieDetailInteractorType?
    
    lazy var dataSource = {
        MovieDetailDataSource(tableView: tableView)
        
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Detalhe"
        view.backgroundColor = .white
        
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        interactor?.fetchMovie()
    }
    
    func displayMovieDetail(viewModel: ViewModel) {
        
        dataSource.viewModel = viewModel
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

extension MovieDetailViewController {
    
    struct ViewModel {
        
        let poster: MoviePosterTableViewCell.ViewModel
        let releaseDate: MovieTextTableViewCell.ViewModel
        let genres: MovieTextTableViewCell.ViewModel
        let overview: MovieOverviewTableViewCell.ViewModel
    }
}
