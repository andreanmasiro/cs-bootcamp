//
//  MovieTarget.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 27/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Moya

enum MovieTarget: TargetType {
    
    case popular(Int)
    
    var baseURL: URL {
        return APIBase.baseUrl
    }
    
    var path: String {
        switch self {
        case .popular: return "/movie/popular"
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
        
        switch self {
        case .popular(let page): return ["api_key": APISettings.key, "page": page]
        }
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
    var headers: [String: String]? {
        return nil
    }
}
