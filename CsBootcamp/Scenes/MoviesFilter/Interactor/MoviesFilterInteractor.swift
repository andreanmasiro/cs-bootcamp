//
//  MoviesFilterInteractor.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 06/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

protocol MoviesFilterPresenterType: class{
    func showFilterDetailList(viewModels: [String])
}

final class MoviesFilterInteractor: MoviesFilterInteractorType {
 
    weak var presenter: MoviesFilterPresenterType?
    weak var moviesFilterViewController: MoviesFilterViewController?
    
    init(presenter: MoviesFilterPresenterType) {
        self.presenter = presenter
        moviesFilterViewController?.moviesFilterInteractorType = self
    }

    var itens_1 = ["2009", "2008", "2007"]
    var itens_2 = ["Teste", "Teste 2", "Teste 3"]
    
    func showFilterDetail(at index: Int) {
        
        if index == 0 {
            presenter?.showFilterDetailList(viewModels: itens_1)
        }
        if index == 1 {
            presenter?.showFilterDetailList(viewModels: itens_2)
        }
    }
}
