//
//  MovieGenreTableViewCell.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 26/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class MovieGenreTableViewCell: UITableViewCell {
    
    let genreYearLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.black
        
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupReleaseDate(movie: Movie) {
        self.genreYearLabel.text = movie.releaseDate.yearToString()
    }
    
    func setupGenres(genre: Genre) {
        self.genreYearLabel.text = genre.name
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(genreYearLabel)
    }
    
    private func setupConstraints() {
        genreYearLabel
            .topAnchor(equalTo: contentView.topAnchor)
            .bottomAnchor(equalTo: contentView.bottomAnchor)
            .trailingAnchor(equalTo: contentView.trailingAnchor)
            .leadingAnchor(equalTo: contentView.leadingAnchor)
    }
}

extension MovieGenreTableViewCell {
    
    struct ViewModel {
        
        let description: String
    }
}
