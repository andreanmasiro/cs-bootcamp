//
//  MovieCollectionViewCell.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static var cellSize: CGSize {
        
        let width = CGFloat(160).proportionalToWidth
        let height = width * 1.45
        
        return CGSize(width: width, height: height)
    }
    
    private let imageFetcher: ImageFetcher = KingfisherImageFetcher()
    
    lazy var imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.Bootcamp.yellow
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupConstraints()
        
        contentView.backgroundColor = UIColor.Bootcamp.darkBlue
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    func setup(viewModel: ViewModel) {
        
        titleLabel.text = viewModel.title
        imageFetcher.fetchImage(from: viewModel.imageURL, to: imageView) { }
    }
    
    private func setupViewHierarchy() {
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        
        imageView
            .topAnchor(equalTo: contentView.topAnchor)
            .leadingAnchor(equalTo: contentView.leadingAnchor)
            .trailingAnchor(equalTo: contentView.trailingAnchor)
            .heightAnchor(equalTo: bounds.width * 1.25)
        
        titleLabel
            .topAnchor(equalTo: imageView.bottomAnchor)
            .leadingAnchor(equalTo: contentView.leadingAnchor)
            .trailingAnchor(equalTo: contentView.trailingAnchor)
            .bottomAnchor(equalTo: contentView.bottomAnchor)
    }
}

extension MovieCollectionViewCell {
    
    struct ViewModel {
        
        let imageURL: URL
        let title: String
    }
}
