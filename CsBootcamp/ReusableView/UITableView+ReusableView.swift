//
//  UITableView+ReusableView.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 23/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T
    }
}
