//
//  MovieDetailDataSource.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 23/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class MovieDetailDataSource: NSObject, UITableViewDataSource {
    
    private unowned let tableView: UITableView
    
    let movie: Movie = Movie(id: 0,
                      genreIds: [],
                      title: "Avengers",
                      overview: "Some overview",
                      releaseDate: Date(),
                      posterUrl: URL(string: "https://www.elastic.co/assets/bltada7771f270d08f6/enhanced-buzz-1492-1379411828-15.jpg")!)
    
    let genre: Genre = Genre(id: 1, name: "Action")
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }
    
    private func registerCells(in tavleView: UITableView) {
        tableView.register(MoviePosterTableViewCell.self)
        tableView.register(MovieGenreTableViewCell.self)
        tableView.register(MovieOverviewTableViewCell.self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(MoviePosterTableViewCell.self, for: indexPath) else {

                return UITableViewCell()
            }
            cell.setup(movie: movie)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(MovieGenreTableViewCell.self, for: indexPath) else {
                
                return UITableViewCell()
            }
            cell.setupReleaseDate(movie: movie)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(MovieGenreTableViewCell.self, for: indexPath) else {
                
                return UITableViewCell()
            }
            cell.setupGenres(genre: genre)
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(MovieOverviewTableViewCell.self, for: indexPath) else {
                
                return UITableViewCell()
            }
            cell.setup(movie: movie)
            return cell
        default:
             return UITableViewCell()
        }
    }
    
    
}
