//
//  Movie.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    let id: Int
    let genreIds: [Int]
    let title: String
    let overview: String
    let releaseDate: Date
    let posterPath: String
    
    init(id: Int, genreIds: [Int], title: String, overview: String, releaseDate: Date, posterPath: String) {
        
        self.id = id
        self.genreIds = genreIds
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
        self.posterPath = posterPath
    }
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case genreIds = "genre_ids"
        case title
        case overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}
