//
//  AppDelegate.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        //TODO: REMOVER
        // TODO: swiftlint
        let rootViewController = MovieDetailViewController()
        let presenter =  MovieDetailPresenter(view: rootViewController)
        let interactor = MovieDetailInteractor(presenter: presenter)
        rootViewController.interactor = interactor
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.barTintColor = UIColor.Bootcamp.yellow
        navigationController.navigationBar.isTranslucent = false
        let screen = UIScreen.main
        window = UIWindow(frame: screen.bounds)
        window?.rootViewController = navigationController
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        return true
    }
}

