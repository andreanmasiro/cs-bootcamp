//
//  KingfisherImageFetcher.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 27/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Kingfisher

final class KingfisherImageFetcher: ImageFetcher {
    
    func fetchImage(from url: URL, to imageView: UIImageView, callback: @escaping () -> ()) {
        
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url) { _, _, _, _ in
            callback()
        }
    }
}
