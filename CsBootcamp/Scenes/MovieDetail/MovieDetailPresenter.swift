//
//  MovieDetailPresenter.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 26/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

protocol MovieDetailView: class {
    
    func displayMovieDetail(viewModel: MovieDetailViewController.ViewModel)
}

final class MovieDetailPresenter: MovieDetailPresenterType {

    typealias ViewModel = (poster: MoviePosterTableViewCell.ViewModel, releaseDate: MovieTextTableViewCell.ViewModel, genre: MovieTextTableViewCell.ViewModel, overview: MovieOverviewTableViewCell.ViewModel)
    
    private typealias MoviePosterViewModel = MoviePosterTableViewCell.ViewModel
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }()
    
    unowned let view: MovieDetailView
    
    init(view: MovieDetailView) {
        
        self.view = view
    }
    
    func presentMovie(_ movie: Movie, _ genres: [Genre]) {
        
        let moviePosterViewModel = MoviePosterViewModel(imageURL: movie.posterUrl, title: movie.title)
        
        let genresDescription = genres.map({$0.name}).joined(separator: ", ")
        let releaseDateDescription = dateFormatter.string(from: movie.releaseDate)
        
        let genresViewModel = MovieTextTableViewCell.ViewModel(description: genresDescription)
        let releaseDateViewModel = MovieTextTableViewCell.ViewModel(description: releaseDateDescription)
        
        let overviewViewModel = MovieOverviewTableViewCell.ViewModel(overview: movie.overview)
       
        let viewModel = MovieDetailViewController.ViewModel(poster: moviePosterViewModel,
                                                            releaseDate: releaseDateViewModel,
                                                            genres: genresViewModel,
                                                            overview: overviewViewModel)
        view.displayMovieDetail(viewModel: viewModel)
    }
    
}
