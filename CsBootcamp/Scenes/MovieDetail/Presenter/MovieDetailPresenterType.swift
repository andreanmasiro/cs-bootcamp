//
//  MovieDetailPresenterType.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 06/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

protocol MovieDetailPresenterType {
    
    func presentMovie(response: FetchMovieDetailResponse)
}

struct FetchMovieDetailResponse {
    
    let posterPath: String
    let releaseDate: Date
    let title: String
    let overview: String
    let isFavorite: Bool
    let genreNames: [String]
}
