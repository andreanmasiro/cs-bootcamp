//
//  AppDelegate.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let isTesting = NSClassFromString("XCTestCase") != nil
        if !isTesting {
            
            let rootViewController = MoviesListViewController()
            let presenter = MoviesListPresenter(view: rootViewController)
            let interactor = MoviesListInteractor(presenter: presenter, moviesListGateway: MoviesListMoyaGateway())
            
            rootViewController.interactor = interactor
            
            let navigationController = UINavigationController(rootViewController: rootViewController)
            navigationController.navigationBar.barTintColor = UIColor.Bootcamp.yellow
            navigationController.navigationBar.isTranslucent = false
            let screen = UIScreen.main
            
            let window = UIWindow(frame: screen.bounds)
            window.rootViewController = navigationController
            window.backgroundColor = UIColor.white
            window.makeKeyAndVisible()
            
            self.window = window
        }
        return true
    }
}
