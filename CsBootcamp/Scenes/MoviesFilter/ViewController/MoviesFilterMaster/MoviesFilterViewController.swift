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
    func genre(at index: Int) -> Genre
    func releaseYear(at index: Int) -> Int
}

class MoviesFilterViewController: UIViewController, FilterView {

    var applyFilter: ((Genre?, Int?) -> ())?
    
    var updateDetailLabelOption: (([String]) -> (Int) -> ()) = { _ in { _ in } }
    private let filterOptionTypes =  ["Date", "Genres"]
    private var presentingOptionsIndex = 0
    private var curentSelectedOptionIndexes: [Int: Int] = [:]
    
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
        button.setTitle("Apply", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(applyFilterAction), for: .touchUpInside)
        return button
    }()
    
    lazy var dataSource: MoviesFilterDataSource = {
        
        let dataSource = MoviesFilterDataSource(tableView: tableView)
        return dataSource
    }()
    
    var moviesFilterInteractor: MoviesFilterInteractorType?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        dataSource.didSelectItem = self.filterSelected
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.filterOptionTypes = filterOptionTypes
        title = "Filter"
        view.backgroundColor = .white
        setupViewHierarchy()
        setupConstraints()
    }
    
    private func filterSelected(at index: Int) {
        setUpdateDetailLabel(withIndex: index)
        moviesFilterInteractor?.showFilterDetail(at: index)
        presentingOptionsIndex = index
    }

    func displayFilterDetail(viewModels: [String]) {
        navigateToDetailOfFilter(options: viewModels)
    }
    
    func navigateToDetailOfFilter(options: [String]) {
        let vc = MoviesFilterDetailViewControllerFactory.make(
            withOptions: options,
            currentSelectedOptionIndex:
            curentSelectedOptionIndexes[presentingOptionsIndex],
            didSelectOptionAtIndex: updateDetailLabelOption(options)
        )
        show(vc, sender: nil)
    }
    
    @objc private func applyFilterAction(sender: UIButton) {

        let releaseYear = curentSelectedOptionIndexes[0].flatMap {
            moviesFilterInteractor?.releaseYear(at: $0)
        }
        
        let genre = curentSelectedOptionIndexes[1].flatMap {
            moviesFilterInteractor?.genre(at: $0)
        }
        applyFilter?(genre, releaseYear)
    }
    
    private func setUpdateDetailLabel(withIndex index: Int) {
        updateDetailLabelOption = { options in
            { optionIndex in
                self.dataSource.filterOptions[index] = options[optionIndex]
                self.curentSelectedOptionIndexes[index] = optionIndex
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
            .bottomAnchor(equalTo: view.bottomAnchor, constant: -16)
            .trailingAnchor(equalTo: view.trailingAnchor, constant: -32)
            .leadingAnchor(equalTo: view.leadingAnchor, constant: 32)
            .heightAnchor(equalTo: 44)
    }
}
