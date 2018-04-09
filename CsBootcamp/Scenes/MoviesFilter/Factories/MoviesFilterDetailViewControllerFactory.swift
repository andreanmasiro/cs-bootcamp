//
//  MoviesFilterDetailViewControllerFactory.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 06/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class MoviesFilterDetailViewControllerFactory {
    
    static func make(withOptions options: [String], currentSelectedOptionIndex: Int?, didSelectOptionAtIndex: ((Int) -> ())?) -> UIViewController {
        
        let viewController = MoviesFilterDetailViewController(options: options)
        viewController.didSelectOptionAtIndex = didSelectOptionAtIndex
        viewController.selectedOptionIndex = currentSelectedOptionIndex
        return viewController
    }
}
