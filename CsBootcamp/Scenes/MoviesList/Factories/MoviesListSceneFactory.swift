//
//  MoviesListSceneFactory.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 29/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

final class MoviesListSceneFactory {
    
    static func make() -> MoviesListViewController {
        
        let viewController = MoviesListViewController()
        let presenter = MoviesListPresenter(view: viewController)
        
        let moviesListGateway = MoviesListGatewayFactory.make()
        let listInteractor = MoviesListInteractor(presenter: presenter, moviesListGateway: moviesListGateway)
        let showDetailInteractor = MoviesListShowDetailInteractor(moviesListGateway: moviesListGateway, showMovieDetailNavigator: viewController)
        
        viewController.listInteractor = listInteractor
        viewController.showDetailInteractor = showDetailInteractor
        
        return viewController
    }
}

final class MoviesListGatewayFactory {
    
    static func make() -> MoviesListGateway {
        return MoviesListMoyaGateway()
    }
}
