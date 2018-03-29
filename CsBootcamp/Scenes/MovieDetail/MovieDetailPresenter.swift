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
    
    unowned let view: MovieDetailView
    
    init(view: MovieDetailView) {
        
        self.view = view
    }
    
    func presentMovie(_ movie: Movie, _ genres: [Genre]) {
        
        let moviePosterViewModel = MoviePosterViewModel(imageURL: URL(string: "https://image.tmdb.org/t/p/w500/b6ZJZHUdMEFECvGiDpJjlfUWela.jpg")!, title: movie.title)
        
        let genresDescription = genres.map({$0.name}).joined(separator: ", ")
        let releaseDateDescription = movie.releaseDate.yearToString()
        
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
