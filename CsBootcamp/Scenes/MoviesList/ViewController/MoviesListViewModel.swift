//
//  MoviesListViewModel.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 27/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit.UIImage

struct MoviesListViewModel {
    
    let cellViewModels: [MovieCollectionViewCell.ViewModel]
}

struct MoviesListErrorViewModel {
    
    let image: UIImage
    let message: String
}

extension MoviesListErrorViewModel {
    
    init() {
        
        self.image = #imageLiteral(resourceName: "error_icon")
        self.message = "Um error ocorreu. Por favor, tente novamente."
    }
}
