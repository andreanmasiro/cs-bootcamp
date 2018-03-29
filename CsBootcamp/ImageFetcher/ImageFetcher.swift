//
//  ImageFetcher.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 23/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

protocol ImageFetcher {
    
    func fetchImage(from url: URL, to imageView: UIImageView, callback: @escaping () -> ())
}

final class ImageFetcherStub: ImageFetcher {
    
    func fetchImage(from url: URL, to imageView: UIImageView, callback: @escaping () -> ()) {
        
        imageView.image = #imageLiteral(resourceName: "poster_stub")
        callback()
    }
}
