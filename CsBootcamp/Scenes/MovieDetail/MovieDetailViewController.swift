//
//  MovieDetailViewController.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 23/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
    }()
    
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Detalhe"
        
        setupViewHierarchy()
        setupConstraints()
        
        view.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    private func setup() {
    
    }
    
    private func setupViewHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView
            .topAnchor(equalTo: view.topAnchor)
            .bottomAnchor(equalTo: view.bottomAnchor)
            .trailingAnchor(equalTo: view.trailingAnchor)
            .leadingAnchor(equalTo: view.leftAnchor)
    }
    
}
