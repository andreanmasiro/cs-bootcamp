//
//  MovieDetailInteractor.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 26/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

protocol MovieDetailPresenterType {
    
    func presentMovie(_ movie: Movie, _ genres: [Genre])
}

final class MovieDetailInteractor: MovieDetailInteractorType {
    

    let presenter: MovieDetailPresenterType
    
    init(presenter: MovieDetailPresenterType) {
        self.presenter = presenter
    }
    
    func fetchMovie() {
        let movie: Movie = Movie(id: 0,
                                 genreIds: [],
                                 title: "Vingadores: Era de Ultron",
                                 overview: "Tony Stark creates the Ultron Program to protect the world, but when the peacekeeping program becomes hostile, The Avengers go into action to try and defeat a virtually impossible enemy together. Earth's mightiest heroes must come together once again to protect the world from global extinction.",
                                 releaseDate: Date(),
                                 posterPath: "https://www.elastic.co/assets/bltada7771f270d08f6/enhanced-buzz-1492-1379411828-15.jpg")
        
        let genres: [Genre] = [Genre(id: 0, name: "Action"), Genre(id: 1, name: "Horror")]
        
        presenter.presentMovie(movie, genres)
    }
    
}
