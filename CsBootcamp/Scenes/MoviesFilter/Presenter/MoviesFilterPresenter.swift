//
//  MoviesFilterPresenter.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 06/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

protocol FilterView: class {
    func displayFilterDetail(viewModels: [String])
}

final class MoviesFilterPresenter: MoviesFilterPresenterType {
    
    private weak var view: FilterView?
    
    init(view: FilterView) {
        self.view = view
    }
    
    func showFilterByGenres(_ genres: [Genre]) {
        
        let genres = genres.map { genre in
            genre.name
        }
        view?.displayFilterDetail(viewModels: genres)
    }
    
    func showFilterByReleaseDates(_ releaseYears: [Int]) {
        
        let releaseYears = releaseYears.map(String.init)
        view?.displayFilterDetail(viewModels: releaseYears)
    }
}
