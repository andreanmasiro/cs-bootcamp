//
//  MovieTextTableViewCellSpec.swift
//  CsBootcampTests
//
//  Created by Lucas Nascimento on 28/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Quick
import Nimble

@testable import CsBootcamp

class MovieTextTableViewCellSpec: QuickSpec {
    
    override func spec() {
        
        typealias ViewModel = MovieDetailViewController.ViewModel
        typealias PosterViewModel = MoviePosterTableViewCell.ViewModel
        typealias TextViewModel = MovieTextTableViewCell.ViewModel
        typealias OverviewViewModel = MovieOverviewTableViewCell.ViewModel
        
        describe("MovieTextTableViewCell") {
        
            var movie: Movie!
            var genre1: Genre!
            var genre2: Genre!
            var genreId1: Int!
            var genreId2: Int!
            var genres: [Int]!

            var viewModel: ViewModel!
            var posterViewModel: PosterViewModel!
            var releaseDateViewModel: TextViewModel!
            var genresViewModel: TextViewModel!
            var overviewViewModel: OverviewViewModel!
            
            var sutReleaseDate : MovieTextTableViewCell!
            var sutRGenres : MovieTextTableViewCell!
            var tableView: UITableView!
            var dataSource: MovieDetailDataSource!
            var cell: UITableViewCell!
            var indexPathRow_1: IndexPath!
            var indexPathRow_2: IndexPath!
            
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
                
                tableView = UITableView(frame: .zero)
                indexPathRow_1 = IndexPath(row: 1, section: 0)
                indexPathRow_2 = IndexPath(row: 2, section: 0)
                dataSource = MovieDetailDataSource(tableView: tableView)
                dataSource.viewModel = viewModel
                
                sutReleaseDate = dataSource.tableView(tableView, cellForRowAt: indexPathRow_1) as! MovieTextTableViewCell
                sutRGenres = dataSource.tableView(tableView, cellForRowAt: indexPathRow_2) as! MovieTextTableViewCell
                
            }
            context("When is initialized", closure: {
                it("Should call setupViewHierarchy  method", closure: {
                    expect(sutReleaseDate.contentView.subviews).to(contain(sutReleaseDate.textLabelCell))
                })
            })
            
            context("When setup method is called", closure: {
                it("Should set releaseDate value for  UILabel", closure: {
                    expect(sutReleaseDate.textLabelCell.text).to(equal(viewModel.releaseDate.description))
                })
                
                it("Should set genres value for  UILabel", closure: {
                    expect(sutRGenres.textLabelCell.text).to(equal(viewModel.genres.description))
                })
            })
            
        }
    }
    
}


