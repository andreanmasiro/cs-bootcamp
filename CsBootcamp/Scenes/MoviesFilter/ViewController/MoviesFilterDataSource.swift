//
//  MoviesFilterDataSource.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 05/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class MoviesFilterDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private weak var tableView: UITableView?
    var didSelectItem: ((Int) -> ())?
    
    var viewModels: [String] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: UITableViewDataSource conforms
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filter = ["Data", "Gênero"]
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = filter[indexPath.item]
        //cell.detailTextLabel?.text = "2008"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .white
        return footerView
    }
    
    // MARK: UITableViewDelegate conforms
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItem?(indexPath.item)
    }
    
}

extension MoviesFilterDataSource {
    
    struct ViewModel {
        
        let filter: String
        let itemSelected: String
    }
}
