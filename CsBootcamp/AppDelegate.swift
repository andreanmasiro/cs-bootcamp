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
        window = MainWindowFactory.make()
        return true
    }
    
    func cacheGenresIfNeeded() {
        let genresCacher = GenresCacherFactory.make()
        genresCacher.cacheGenresIfNeeded()
    }
}
