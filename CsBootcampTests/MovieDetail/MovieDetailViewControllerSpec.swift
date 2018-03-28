//
//  MovieDetailViewControllerSpec.swift
//  CsBootcampTests
//
//  Created by Gabriel Preto on 27/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MovieDetailViewControllerSpec: QuickSpec {
    
    typealias ViewModel = MovieDetailViewController.ViewModel
    typealias PosterViewModel = MoviePosterTableViewCell.ViewModel
    typealias TextViewModel = MovieTextTableViewCell.ViewModel
    typealias OverviewViewModel = MovieOverviewTableViewCell.ViewModel
    
    override func spec() {
        
        var sut: MovieDetailViewController!
        var presenter: MovieDetailPresenter!
        
        var movie: Movie!
        var genre1: Genre!
        var genre2: Genre!
        var genreId1: Int!
        var genreId2: Int!
        var genres: [Int]!
        var tableView: UITableView!
        var cell: UITableViewCell!
        var indexPath: IndexPath!
        var viewModel: ViewModel!
        var posterViewModel: PosterViewModel!
        var releaseDateViewModel: TextViewModel!
        var genresViewModel: TextViewModel!
        var overviewViewModel: OverviewViewModel!
        
        describe("MovieDetailViewController") {
            
            beforeSuite {
                genre1 = Genre(id: 1, name: "Sci-Fi")
                genre2 = Genre(id: 2, name: "Action")
                genreId1 = genre1.id
                genreId2 = genre2.id
                genres = [genreId1, genreId2]
                movie = Movie(id: 1,
                              genreIds: genres,
                              title: "Star Wars - The Last Jedi",
                              overview: "Rey develops her newly discovered abilities with the guidance of Luke Skywalker, who is unsettled by the strength of her powers. Meanwhile, the Resistance prepares for battle with the First Order.",
                              releaseDate: Date(),
                              posterUrl: URL(string: "https://www.elastic.co/assets/bltada7771f270d08f6/enhanced-buzz-1492-1379411828-15.jpg")!)
                posterViewModel = PosterViewModel(imageURL: movie.posterUrl, title: movie.title)
                
                releaseDateViewModel = TextViewModel(description: movie.releaseDate.yearToString())
                
                genresViewModel = TextViewModel(description: "\(genre1), \(genre2)")
                
                overviewViewModel = OverviewViewModel(overview: movie.overview)
                
                viewModel = ViewModel(poster: posterViewModel, releaseDate: releaseDateViewModel, genres: genresViewModel, overview: overviewViewModel)
            }
            
            context("when it's initialized", closure: {
                
                beforeEach {
                    sut = MovieDetailViewController()
                    presenter = MovieDetailPresenter(view: sut)
                }
                
                it("should setup the view hierarchy", closure: {
                    expect(sut.view.subviews.contains(sut.tableView)).to(beTrue())
                })
                
            })
            
            context("when display movie detail is called", closure: {
                
                beforeEach {
                    presenter.view.displayMovieDetail(viewModel: viewModel)
                }
            
                it("should set the data source view model", closure: {
                    expect(sut.dataSource.viewModel == viewModel).to(beTrue())
                })
                
            })
            
            
        }
        
    }
    
}


