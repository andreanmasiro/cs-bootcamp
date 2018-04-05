//
//  UIView+ReusableView.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }
extension UICollectionReusableView: ReusableView { }
