//
//  MovieCollectionViewCell.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    private let imageFetcher: ImageFetcher = ImageFetcherStub()
    
    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupConstraints()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            .heightAnchor(equalTo: bounds.width*160/167)
        
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
