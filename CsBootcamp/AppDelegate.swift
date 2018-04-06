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
    private var genresCacher: GenresCacher?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let docsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        print(docsPath)

        cacheGenresIfNeeded()
        window = MainWindowFactory.make()

        setupSearchBarAppearance()

        return true
    }

    private func setupSearchBarAppearance() {

        let textFieldAppearance = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        textFieldAppearance.backgroundColor = UIColor.Bootcamp.darkYellow

        let cancelButtonAppearance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        cancelButtonAppearance.tintColor = UIColor.Bootcamp.darkBlue

    }

    func cacheGenresIfNeeded() {
        genresCacher = GenresCacherFactory.make()
        genresCacher?.cacheGenresIfNeeded()
    }
}
