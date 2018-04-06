//
//  FavoritesListInteractorType.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 04/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

protocol FavoritesListInteractorType {
    
    func fetchFavorites()
    func removeFavorite(at index: Int)
}
