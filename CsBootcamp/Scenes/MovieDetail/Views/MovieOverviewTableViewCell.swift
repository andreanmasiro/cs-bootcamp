//
//  MovieOverviewTableViewCell.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 26/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class MovieOverviewTableViewCell: UITableViewCell {
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    func setup(viewModel: ViewModel) {
        self.overviewLabel.text = viewModel.overview
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(overviewLabel)
    }
    
    private func setupConstraints() {
        overviewLabel
            .topAnchor(equalTo: contentView.topAnchor, constant: 8)
            .bottomAnchor(equalTo: contentView.bottomAnchor, constant: -8)
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 16)
            .trailingAnchor(equalTo: contentView.trailingAnchor, constant: -8)
    }
}

extension MovieOverviewTableViewCell {
    
    struct ViewModel {
        
        let overview: String
    }
}

