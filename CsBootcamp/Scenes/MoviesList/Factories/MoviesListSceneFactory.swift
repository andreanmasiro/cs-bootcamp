//
//  MoviesListSceneFactory.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 29/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

final class MoviesListSceneFactory {
    
    static func make(coreDataStack: CoreDataStack) -> MoviesListViewController {
        
        let viewController = MoviesListViewController()
        let presenter = MoviesListPresenter(view: viewController)
        
        let moviesListGateway = MoviesListGatewayFactory.make()
        let favoriteMoviesListGateway = FavoriteMoviesListCoreDataGateway(coreDataStack: coreDataStack)
        let listInteractor = MoviesListInteractor(presenter: presenter, moviesListGateway: moviesListGateway, favoriteMoviesListGateway: favoriteMoviesListGateway)
        let showDetailInteractor = MoviesListShowDetailInteractor(showMovieDetailNavigator: viewController)
        
        viewController.listInteractor = listInteractor
        viewController.showDetailInteractor = showDetailInteractor
        viewController.favoriteInteractor = listInteractor
        
        return viewController
    }
}

final class MoviesListGatewayFactory {
    
    static func make() -> MoviesListGateway {
        return MoviesListMoyaGateway()
    }
}
