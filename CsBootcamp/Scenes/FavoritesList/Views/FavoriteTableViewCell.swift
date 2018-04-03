//
//  FavoriteTableViewCell.swift
//  CsBootcamp
//
//  Created by Gabriel Preto on 03/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class FavoriteTableViewCell: UITableViewCell {
    
    private let imagerFetcher: ImageFetcher = KingfisherImageFetcher()
    
    static var cellHeight: CGFloat = CGFloat(120).proportionalToWidth
    
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        
        return label
    }()
    
    lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        
        return label
    }()
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        setupViewHierarchy()
        setupContraints()
        
        contentView.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: ViewModel) {
        
        imagerFetcher.fetchImage(from: viewModel.posterUrl, to: posterImageView) {}
        self.titleLabel.text = viewModel.title
        self.releaseDateLabel.text = viewModel.releaseDate
        self.overviewLabel.text = viewModel.overview
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(releaseDateLabel)
        contentView.addSubview(overviewLabel)
    }
    
    private func setupContraints() {
        posterImageView
            .topAnchor(equalTo: contentView.topAnchor)
            .bottomAnchor(equalTo: contentView.bottomAnchor)
            .leadingAnchor(equalTo: contentView.leadingAnchor)
            .widthAnchor(equalTo: posterImageView.heightAnchor, multiplier: 0.8)
        
        titleLabel
            .topAnchor(equalTo: contentView.topAnchor, constant: 16)
            .leadingAnchor(equalTo: posterImageView.trailingAnchor, constant: 8)
    
    titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        overviewLabel
            .topAnchor(equalTo: titleLabel.bottomAnchor, constant: 16)
            .leadingAnchor(equalTo: titleLabel.leadingAnchor)
            .trailingAnchor(equalTo: contentView.trailingAnchor, constant: -8)
        
        releaseDateLabel
            .topAnchor(equalTo: titleLabel.topAnchor)
            .trailingAnchor(equalTo: contentView.trailingAnchor, constant: -8)
            .leadingAnchor(equalTo: titleLabel.trailingAnchor, constant: 8)
        
    
        
    }
}

extension FavoriteTableViewCell {
    
    struct ViewModel {
        
        let posterUrl: URL
        let title: String
        let releaseDate: String
        let overview: String
    }
    
}
