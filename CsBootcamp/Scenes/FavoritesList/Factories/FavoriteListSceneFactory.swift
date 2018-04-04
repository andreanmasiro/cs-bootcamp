//
//  FavoriteListFactory.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 04/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

final class FavoritesListSceneFactory {
    
    static func make() -> FavoritesListViewController {
        
        let viewController = FavoritesListViewController()
        
        let presenter = FavoritesListPresenter(view: viewController)
        
        let interactor = FavoritesListInteractor(presenter: presenter)
        viewController.interactor = interactor
        
        return viewController
    }
}
