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
    
    static var cellSize: CGFloat = CGFloat(250).proportionalToWidth
    
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    func setup(viewModel: ViewModel) {
        self.titleLabel.text = viewModel.title
        imageFetcher.fetchImage(from: viewModel.imageURL, to: posterImageView) {}
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        posterImageView
            .topAnchor(equalTo: contentView.topAnchor)
            .bottomAnchor(equalTo: titleLabel.topAnchor)
            .trailingAnchor(equalTo: contentView.trailingAnchor)
            .leadingAnchor(equalTo: contentView.leadingAnchor)
    
        titleLabel
            .bottomAnchor(equalTo: contentView.bottomAnchor)
            .trailingAnchor(equalTo: contentView.trailingAnchor, constant: 8)
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 8)
            .heightAnchor(equalTo: 42)
    }
}

extension MoviePosterTableViewCell {
    
    struct ViewModel {
        
        let imageURL: URL
        let title: String
    }
}

