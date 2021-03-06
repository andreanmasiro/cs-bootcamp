//
//  MovieListErrorView.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 27/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

final class MovieListErrorView: UIView {

    lazy var label: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var imageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let iconDiameterRatio: CGFloat
    
    init(frame: CGRect, iconDiameterRatio: CGFloat) {
        
        self.iconDiameterRatio = iconDiameterRatio
        
        super.init(frame: frame)
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
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
        
        imageView
            .widthAnchor(equalTo: widthAnchor, multiplier: iconDiameterRatio)
            .heightAnchor(equalTo: widthAnchor, multiplier: iconDiameterRatio)
            .centerXAnchor(equalTo: centerXAnchor)
            .topAnchor(equalTo: topAnchor, constant: 40)
        
        label
            .topAnchor(equalTo: imageView.bottomAnchor, constant: 16)
            .centerXAnchor(equalTo: centerXAnchor)
            .widthAnchor(equalTo: widthAnchor, multiplier: 0.7)
    }
}
