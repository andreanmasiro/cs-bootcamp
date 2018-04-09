//
//  FavoriteListFactory.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 04/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit.UIViewController

final class FavoritesListSceneFactory {
    
    static func make() -> UIViewController {
        
        let viewController = FavoritesListViewController()
        let presenter = FavoritesListPresenter(view: viewController)
        
        let coreDataStack = DefaultCoreDataStack.shared
        let favoriteMoviesListGateway = FavoriteMoviesListCoreDataGateway(coreDataStack: coreDataStack)
        let genresCacheGateway = GenresCacheCoreDataGateway(coreDataStack: coreDataStack)
        
        let interactor = FavoritesListInteractor(presenter: presenter, favoriteMoviesListGateway: favoriteMoviesListGateway, genresCacheGateway: genresCacheGateway)

        viewController.interactor = interactor
        
        return viewController
    }
}
