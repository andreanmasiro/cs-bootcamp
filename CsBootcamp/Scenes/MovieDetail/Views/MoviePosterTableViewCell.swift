//
//  MovieTableViewCell.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 23/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class MoviePosterTableViewCell: UITableViewCell {
    
    private let imageFetcher: ImageFetcher = ImageFetcherStub()
    
    static var imageSize: CGSize {
        
        let width = CGFloat(165).proportionalToWidth
        let height = CGFloat(247).proportionalToWidth
        
        return CGSize(width: width, height: height)
    }
    
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(viewModel: ViewModel) {
        self.titleLabel.text = viewModel.title
        imageFetcher.fetchImage(from: viewModel.imageURL, to: self.posterImageView) {}
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        
    }
    
    private func setupConstraints() {
        posterImageView
            .topAnchor(equalTo: contentView.topAnchor)
            .bottomAnchor(equalTo: titleLabel.bottomAnchor, constant: 16)
            .trailingAnchor(equalTo: contentView.trailingAnchor)
            .leadingAnchor(equalTo: contentView.leadingAnchor)
        
        titleLabel
            .bottomAnchor(equalTo: contentView.bottomAnchor)
            .trailingAnchor(equalTo: contentView.trailingAnchor)
            .leadingAnchor(equalTo: contentView.leadingAnchor)
            .heightAnchor(equalTo: CGFloat(21).proportionalToWidth)
    }
}

extension MoviePosterTableViewCell {
    
    struct ViewModel {
        
        let imageURL: URL
        let title: String
    }
}
