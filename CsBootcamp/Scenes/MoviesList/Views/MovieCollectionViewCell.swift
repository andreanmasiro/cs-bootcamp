//
//  MovieCollectionViewCell.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    unowned let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    unowned let titleLabel: UILabel = {
        
        let label = UILabel()
        
        return label
    }()
    
    func setup(viewModel: ViewModel) {
        // todo
    }
}

extension MovieCollectionViewCell {
    
    struct ViewModel {
        
        let imageURL: URL
        let title: String
    }
}
