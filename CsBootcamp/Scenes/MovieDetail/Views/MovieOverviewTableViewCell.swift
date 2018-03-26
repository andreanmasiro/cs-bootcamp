//
//  MovieOverviewTableViewCell.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 26/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class MovieOverviewTableViewCell: UITableViewCell {
    
    let cellHeight: CGFloat = 400
    
    let overviewLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.numberOfLines = 4
        
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
    
    func setup(movie: Movie) {
        self.overviewLabel.text = movie.overview
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(overviewLabel)
    }
    
    private func setupConstraints() {
        overviewLabel
            .topAnchor(equalTo: contentView.topAnchor, constant: 16)
            .bottomAnchor(equalTo: contentView.bottomAnchor)
            .trailingAnchor(equalTo: contentView.trailingAnchor)
            .leadingAnchor(equalTo: contentView.leadingAnchor)
    }
}

extension MovieOverviewTableViewCell {
    
    struct ViewModel {
        
        let overview: String
    }
}
