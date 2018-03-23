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
        
        let width = CGFloat(165).proportionalToWidth
        let height = CGFloat(247).proportionalToWidth
        
        return CGSize(width: width, height: height)
    }
    
    private let imageFetcher: ImageFetcher = ImageFetcherStub()
    
    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        
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
            .heightAnchor(equalTo: bounds.width*200/165)
        
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
