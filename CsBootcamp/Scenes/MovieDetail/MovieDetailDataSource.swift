//
//  MovieDetailDataSource.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 23/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class MovieDetailDataSource: NSObject, UITableViewDataSource {
    
    private unowned let tableView: UITableView
    
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }
    
    private func registerCells(in tavleView: UITableView) {
        tableView.register(MovieTableViewCell.self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(MovieTableViewCell.self, for: indexPath) else {
            return UITableViewCell()
        }
        return cell
    }
    
    
}
