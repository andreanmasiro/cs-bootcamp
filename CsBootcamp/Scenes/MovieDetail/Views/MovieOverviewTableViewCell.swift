//
//  MovieOverviewTableViewCell.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 26/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class MovieOverviewTableViewCell: UITableViewCell {
    
    static var cellSize: CGFloat = CGFloat(100).proportionalToWidth
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.font = label.font.withSize(12)
        label.numberOfLines = 6
        
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
    
    func setup(viewModel: ViewModel) {
        self.overviewLabel.text = viewModel.overview
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(overviewLabel)
    }
    
    private func setupConstraints() {
        overviewLabel
            .topAnchor(equalTo: contentView.topAnchor)
            .bottomAnchor(equalTo: contentView.bottomAnchor, constant: 8)
            .trailingAnchor(equalTo: contentView.trailingAnchor, constant: 8)
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 8)
    }
}

extension MovieOverviewTableViewCell {
    
    struct ViewModel {
        
        let overview: String
    }
}

