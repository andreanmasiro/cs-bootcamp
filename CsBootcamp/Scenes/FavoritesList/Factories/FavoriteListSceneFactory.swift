//
//  FavoriteListFactory.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 04/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

final class FavoritesListSceneFactory {
    
    static func make(coreDataStack: CoreDataStack) -> FavoritesListViewController {
        
        let viewController = FavoritesListViewController()
        
        let presenter = FavoritesListPresenter(view: viewController)
        let favoriteMoviesListGateway = FavoriteMoviesListCoreDataGateway(coreDataStack: coreDataStack)
        let interactor = FavoritesListInteractor(presenter: presenter, favoriteMoviesListGateway: favoriteMoviesListGateway)
        viewController.interactor = interactor
        
        return viewController
    }
}