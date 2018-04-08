//
//  MoviesFilterViewController.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 05/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

protocol MoviesFilterInteractorType: class {
    func showFilterDetail(at index: Int)
}

class MoviesFilterViewController: UIViewController, FilterView {

    private var lastSelectedIndex: Int = 0
    var updateDetailLabelOption: (([String]) -> (Int) -> ()) = { _ in { _ in } }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var applyButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor.Bootcamp.yellow
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Aplicar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var dataSource: MoviesFilterDataSource = {
        
        let dataSource = MoviesFilterDataSource(tableView: tableView)
        dataSource.filterOptionTypes = ["Data", "Genero"]
        return dataSource
    }()
    
    var moviesFilterInteractor: MoviesFilterInteractorType?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Filtro"
        view.backgroundColor = .white
        dataSource.didSelectItem = self.filterSelected
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func filterSelected(at index: Int) {
        setUpdateDetailLabel(withIndex: index)
        moviesFilterInteractor?.showFilterDetail(at: index)
    }

    func displayFilterDetail(viewModels: [String]) {
        navigateToDetailOfFilter(options: viewModels)
    }
    
    func navigateToDetailOfFilter(options: [String]) {
        let vc = MoviesFilterDetailViewControllerFactory.make(
            withOptions: options,
            didSelectOptionAtIndex: updateDetailLabelOption(options)
        )
        show(vc, sender: nil)
    }
    
    private func setUpdateDetailLabel(withIndex index: Int) {
        updateDetailLabelOption = { options in
            { optionIndex in
                self.dataSource.filterOptions[index] = options[optionIndex]
            }
        }
    }
    
    private func setupViewHierarchy() {
        view.addSubview(tableView)
        view.addSubview(applyButton)
    }
    
    private func setupConstraints() {

        tableView
            .topAnchor(equalTo: view.topAnchor)
            .bottomAnchor(equalTo: applyButton.bottomAnchor)
            .trailingAnchor(equalTo: view.trailingAnchor)
            .leadingAnchor(equalTo: view.leadingAnchor)
        
        applyButton
            .bottomAnchor(equalTo: view.bottomAnchor, constant: -64)
            .trailingAnchor(equalTo: view.trailingAnchor, constant: -32)
            .leadingAnchor(equalTo: view.leadingAnchor, constant: 32)
            .heightAnchor(equalTo: 44)
    }
}
