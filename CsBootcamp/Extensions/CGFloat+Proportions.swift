//
//  CGFloat+Proportions.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

extension CGFloat {
    
    var proportionalToWidth: CGFloat {
        return self * UIScreen.widthProportion
    }
}
