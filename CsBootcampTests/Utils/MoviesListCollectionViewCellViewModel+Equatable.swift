//
//  MoviesListCollectionViewCellViewModel+Equatable.swift
//  CsBootcampTests
//
//  Created by Andre Rodrigues on 28/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

@testable import CsBootcamp

extension MovieCollectionViewCell.ViewModel: Equatable {
    
    public static func ==(lhs: MovieCollectionViewCell.ViewModel, rhs: MovieCollectionViewCell.ViewModel) -> Bool {
        
        return lhs.imageURL == rhs.imageURL &&
            lhs.title == rhs.title
    }
}
