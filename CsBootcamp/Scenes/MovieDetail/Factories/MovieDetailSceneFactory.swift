//
//  MovieDetailSceneFactory.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 29/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

final class MovieDetailSceneFactory {
    
    static func make(with movie: Movie) -> MovieDetailViewController {
        
        let viewController = MovieDetailViewController()
        let presenter = MovieDetailPresenter(view: viewController)
        let interactor = MovieDetailInteractor(presenter: presenter)
        
        viewController.interactor = interactor
        
        return viewController
    }
}
