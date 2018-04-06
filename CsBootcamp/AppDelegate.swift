//
//  AppDelegate.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit
import Foundation

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let docsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        print(docsPath)
        
        cacheGenresIfNeeded()
        
        let moviesListViewController = MoviesListSceneFactory.make()
        let favoritesListViewController = FavoritesListSceneFactory.make()

        let moviesNavigationController = UINavigationControllerFactory.make(with: moviesListViewController)
        let favoritesNavigationController = UINavigationControllerFactory.make(with: favoritesListViewController)

        let tabBarController = UITabBarControllerFactory.make(with: moviesNavigationController, favoritesNavigationController)
        
        let screen = UIScreen.main

        let window = UIWindow(frame: screen.bounds)
        window.rootViewController = tabBarController
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()

        self.window = window
        return true
    }
    
    func cacheGenresIfNeeded() {
        
        let coreDataStack = DefaultCoreDataStack()
        let genresListGateway = GenresListMoyaGateway()
        let genresCacheGateway = GenresCacheCoreDataGateway(coreDataStack: coreDataStack)
        
        let genresCacher = GenresCacher(genresListGateway: genresListGateway, genresCacheGateway: genresCacheGateway)
        genresCacher.cacheGenresIfNeeded()
    }
}
