//
//  MovieGenreTableViewCell.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 26/03/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class MovieTextTableViewCell: UITableViewCell {
    
    static var cellSize: CGFloat = CGFloat(30).proportionalToWidth
    
    lazy var textLabelCell: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.black
        
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: ViewModel) {
        self.textLabelCell.text = viewModel.description
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(textLabelCell)
    }
    
    private func setupConstraints() {
        textLabelCell
            .topAnchor(equalTo: contentView.topAnchor)
            .bottomAnchor(equalTo: contentView.bottomAnchor)
            .trailingAnchor(equalTo: contentView.trailingAnchor, constant: 8)
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 8)
    }
}

extension MovieTextTableViewCell {
    
    struct ViewModel {

        let description: String
    }
}

