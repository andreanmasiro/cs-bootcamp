//
//  AppDelegate.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController = MoviesListSceneFactory.make()
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.barTintColor = UIColor.Bootcamp.yellow
        navigationController.navigationBar.tintColor = UIColor.black
        navigationController.navigationBar.isTranslucent = false
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        
        setupSearchBarAppearance()
        
        self.window = window
        return true
    }
    
    private func setupSearchBarAppearance() {
        
        let textFieldAppearance = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        textFieldAppearance.backgroundColor = UIColor.Bootcamp.darkYellow
        
        let cancelButtonAppearance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        cancelButtonAppearance.tintColor = UIColor.Bootcamp.darkBlue
    }
}
