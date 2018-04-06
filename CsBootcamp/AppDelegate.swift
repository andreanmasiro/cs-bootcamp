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
        
        //let rootViewController = MoviesListSceneFactory.make()
        
        let rootViewController = MoviesFilterViewController()
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.barTintColor = UIColor.Bootcamp.yellow
        navigationController.navigationBar.tintColor = UIColor.black
        navigationController.navigationBar.isTranslucent = false
        let screen = UIScreen.main
        
        let window = UIWindow(frame: screen.bounds)
        window.rootViewController = navigationController
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        
        self.window = window
        return true
    }
}
