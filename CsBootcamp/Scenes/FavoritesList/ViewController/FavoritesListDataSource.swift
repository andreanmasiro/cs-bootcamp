//
//  FavoritesListDataSource.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 03/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class FavoritesListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private weak var tableView: UITableView?
    
    var viewModels: [FavoriteTableViewCell.ViewModel] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        registerCells(in: tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    private func registerCells(in tableView: UITableView) {
        
        tableView.register(FavoriteTableViewCell.self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(FavoriteTableViewCell.self, for: indexPath)!
        cell.setup(viewModel: viewModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return FavoriteTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNonzeroMagnitude
    }
}
