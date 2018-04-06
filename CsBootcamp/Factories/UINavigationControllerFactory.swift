//
//  NavigationController.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 03/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class UINavigationControllerFactory {
    
    static func make(with rootViewController: UIViewController) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.navigationBar.barTintColor = UIColor.Bootcamp.yellow
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = false
        
        let font = UIFont.systemFont(ofSize: 17, weight: .light)
        let attributes = [NSAttributedStringKey.font: font]
        navigationController.navigationBar.titleTextAttributes = attributes
        
        return navigationController
    }
}
