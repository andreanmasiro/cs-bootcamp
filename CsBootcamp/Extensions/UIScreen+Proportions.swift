//
//  UIScreen+Proportions.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

extension UIScreen {
    
    private static let iPhone6Width: CGFloat = 375
    
    static var widthProportion: CGFloat {
        
        return iPhone6Width/main.bounds.width
    }
}
