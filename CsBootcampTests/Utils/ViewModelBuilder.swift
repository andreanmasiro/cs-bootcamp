//
//  File.swift
//  CsBootcampTests
//
//  Created by Gabriel Preto on 28/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

@testable import CsBootcamp

class ViewModelBuilder: NSObject {
    
    typealias ViewModel = MovieDetailViewController.ViewModel
    typealias PosterViewModel = MoviePosterTableViewCell.ViewModel
    typealias TextViewModel = MovieTextTableViewCell.ViewModel
    typealias OverviewViewModel = MovieOverviewTableViewCell.ViewModel
    
    static func build() -> ViewModel {
        
        let genre1 = Genre(id: 1, name: "Sci-Fi")
        let genre2 = Genre(id: 2, name: "Action")
        let genreId1 = genre1.id
        let genreId2 = genre2.id
        let genres = [genreId1, genreId2]
        let movie = Movie(id: 1,
                      genreIds: genres,
                      title: "Star Wars - The Last Jedi",
                      overview: "Rey develops her newly discovered abilities with the guidance of Luke Skywalker, who is unsettled by the strength of her powers. Meanwhile, the Resistance prepares for battle with the First Order.",
                      releaseDate: Date(),
                      posterPath: "https://www.elastic.co/assets/bltada7771f270d08f6/enhanced-buzz-1492-1379411828-15.jpg")
        
        var dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy"
            return dateFormatter
        }()
        
        let posterViewModel = PosterViewModel(imageURL: URL(string: movie.posterPath)!, title: movie.title)
        
        let releaseDateViewModel = TextViewModel(description: dateFormatter.string(from: movie.releaseDate))
        
        let genresViewModel = TextViewModel(description: "\(genre1), \(genre2)")
        
        let overviewViewModel = OverviewViewModel(overview: movie.overview)
        
        let viewModel = ViewModel(poster: posterViewModel, releaseDate: releaseDateViewModel, genres: genresViewModel, overview: overviewViewModel)
        
        return viewModel
    }
    
}
