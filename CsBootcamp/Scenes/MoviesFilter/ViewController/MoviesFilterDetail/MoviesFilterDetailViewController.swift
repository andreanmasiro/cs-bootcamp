//
//  MoviesFilterDetailViewController.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 06/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class MoviesFilterDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var didSelectOptionAtIndex: ((Int) -> ())?
    
    let options: [String]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    init(options: [String]) {
        
        self.options = options
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        
        setupViewHierarchy()
        setupConstraints()
        tableView.reloadData()
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            didSelectOptionAtIndex?(indexPath.row)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
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
    
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(frame: .zero)
        let option = options[indexPath.row]
        cell.textLabel?.text = option
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dismiss(animated: true, completion: nil)
    }
}
