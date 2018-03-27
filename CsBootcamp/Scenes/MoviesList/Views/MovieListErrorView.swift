//
//  MovieListErrorView.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 27/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class MovieListErrorView: UIView {

    private lazy var label: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupViewHierarchy()
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setups
    
    func setup(viewModel: MoviesListErrorViewModel) {
        
        label.text = viewModel.message
        imageView.image = viewModel.image
    }
    
    private func setupViewHierarchy() {
        
        addSubview(label)
        addSubview(imageView)
    }
    
    private func setupConstraints() {
        
        let iconDiameter = bounds.width * 0.5
        
        imageView
            .widthAnchor(equalTo: iconDiameter)
            .heightAnchor(equalTo: iconDiameter)
            .centerXAnchor(equalTo: centerXAnchor)
            .centerYAnchor(equalTo: centerYAnchor)
        
        label
            .topAnchor(equalTo: imageView.bottomAnchor, constant: 16)
            .centerXAnchor(equalTo: centerXAnchor)
    }
}
