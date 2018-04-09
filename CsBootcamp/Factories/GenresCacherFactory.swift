//
//  GenresCacherFactory.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 06/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation

final class GenresCacherFactory {
    
    static func make() -> GenresCacher {
        
        let coreDataStack = DefaultCoreDataStack.shared
        let genresListGateway = GenresListMoyaGateway()
        let genresCacheGateway = GenresCacheCoreDataGateway(coreDataStack: coreDataStack)
        
        let genresCacher = GenresCacher(genresListGateway: genresListGateway, genresCacheGateway: genresCacheGateway)
        
        return genresCacher
    }
}
