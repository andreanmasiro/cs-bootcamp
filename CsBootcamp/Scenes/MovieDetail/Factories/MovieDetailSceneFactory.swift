//
//  MovieDetailSceneFactory.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 29/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit.UIViewController

final class MovieDetailSceneFactory {
    
    static func make(with movie: Movie) -> UIViewController {
        
        let viewController = MovieDetailViewController(movie: movie)
        let presenter = MovieDetailPresenter(view: viewController)
        let interactor = MovieDetailInteractor(presenter: presenter)
        
        viewController.interactor = interactor
        
        return viewController
    }
}
