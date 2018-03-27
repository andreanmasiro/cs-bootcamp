//
//  MovieTarget.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 27/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Moya

enum MovieTarget: TargetType {
    
    case popular
    
    var baseURL: URL {
        return APIBase.movieBaseURL
    }
    
    var path: String {
        switch self {
        case .popular: return "/popular"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {

        return .requestParameters(
            parameters: parameters,
            encoding: URLEncoding.queryString
        )
    }
    
    var parameters: [String: Any] {
        
        return ["api_key": APISettings.key]
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
    var headers: [String: String]? {
        return nil
    }
}
