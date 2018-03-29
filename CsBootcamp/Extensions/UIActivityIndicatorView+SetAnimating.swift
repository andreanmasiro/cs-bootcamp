//
//  UIActivityIndicatorView+SetAnimating.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit.UIActivityIndicatorView

extension UIActivityIndicatorView {
    
    func setAnimating(_ animating: Bool) {
        
        if animating {
            startAnimating()
        } else {
            stopAnimating()
        }
    }
}
