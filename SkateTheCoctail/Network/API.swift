//
//  API.swift
//  SkateTheCoctail
//
//  Created by Burak Arslan on 19.04.2021.
//
import Foundation
import Moya

enum CoctailService {
    case getCocktail
}

extension CoctailService : TargetType {
    
    var sampleData: Data {
        return Data()
    }
    
    var baseURL: URL {
        switch self {
        default:
            return URL(string: "https://www.thecocktaildb.com/api/json/v1/1/")!
        }
    }
    
    var path: String {
        switch self {
        case .getCocktail:
            return "random.php"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCocktail:
            return .get
        }
    }
    
    var headers: [String : String]?{
        switch self {
        case .getCocktail:
            return ["Content-type": "application/json"]
        }
    }
    
    var task: Task {
        switch self {
        case .getCocktail:
            return .requestPlain
    }
}
}



