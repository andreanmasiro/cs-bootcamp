//
//  APIBase.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 27/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

struct APIBase {
    
    static let movieBaseURL = URL(string: "https://api.themoviedb.org/3/movie")!
    private static let imageBaseURL = URL(string: "https://image.tmdb.org/t/p/w500")!
    
    static func posterImageURL(path: String) -> URL {
        
        return imageBaseURL.appendingPathComponent(path)
    }
}
