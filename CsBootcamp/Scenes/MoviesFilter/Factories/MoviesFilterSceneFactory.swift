//
//  MoviesFilterSceneFactory.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 06/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class MoviesFilterSceneFactory {
    
    static func make() -> UIViewController {
        
        let viewController = MoviesFilterViewController()
        let presenter = MoviesFilterPresenter(view: viewController)
        
        let gateway = GenresCacheCoreDataGateway(coreDataStack: DefaultCoreDataStack())
        
        let interactor = MoviesFilterInteractor(presenter: presenter, gateway: gateway)
        
        viewController.moviesFilterInteractor = interactor
        
        return viewController
    }
}
