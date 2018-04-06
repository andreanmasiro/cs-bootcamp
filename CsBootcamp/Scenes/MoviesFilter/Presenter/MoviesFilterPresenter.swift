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
    
    func showFilterDetailList(viewModels: [String]) {
        view?.displayFilterDetail(viewModels: viewModels)
    }

}
