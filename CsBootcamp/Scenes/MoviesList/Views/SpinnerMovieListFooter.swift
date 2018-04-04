//
//  SpinnerMovieListFooter.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 04/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class SpinnerMovieListFooter: UICollectionReusableView {
    
    weak var activityIndicator: UIActivityIndicatorView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
    }
    
    func setup(activityIndicator: UIActivityIndicatorView) {
        setupViewHierarchy(activityIndicator: activityIndicator)
        setupConstraints(activityIndicator: activityIndicator)
    }
    
    private func setupViewHierarchy(activityIndicator: UIActivityIndicatorView) {

        self.addSubview(activityIndicator)
    }

    private func setupConstraints(activityIndicator: UIActivityIndicatorView) {
        activityIndicator
            .centerXAnchor(equalTo: self.centerXAnchor)
            .centerYAnchor(equalTo: self.centerYAnchor)
    }
}
