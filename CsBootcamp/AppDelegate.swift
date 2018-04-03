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
        
        let moviesListViewController = MoviesListSceneFactory.make()
        
        let moviesNavigationController = UINavigationControllerFactory.make(with: moviesListViewController)
        
        let viewControllers = [moviesNavigationController]
        
        let tabBarController = UITabBarControllerFactory.make(with: viewControllers)
        
        let screen = UIScreen.main
        
        let window = UIWindow(frame: screen.bounds)
        window.rootViewController = tabBarController
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        
        self.window = window
        return true
    }
}
