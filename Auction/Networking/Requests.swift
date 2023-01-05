//
//  Requests.swift
//  Auction
//
//  Created by jobzella on 04/01/2023.
//

import Foundation
import Moya
let base = "https://staging.mazaady.com/api/v1/"
public enum Requests {
    case categories
    case subCategories(id:Int)
    case optionChild(id:Int)
}

extension Requests:TargetType{
    public var headers: [String : String]? {
        switch self {
        case .categories,.subCategories,.optionChild:
            return nil
        }
    }
    
    public var baseURL: URL {
        return URL(string:base)!
    }
    
    public var path: String {
        switch self {
        case .categories : return "get_all_cats"
        case .subCategories:return "properties"
        case .optionChild(let id):return "get-options-child/\(id)"
        }
        
        
    }
    
    public var method: Moya.Method {
        switch self {
        case .categories,.subCategories,.optionChild : return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self{

        case .categories,.optionChild : return .requestPlain
            
        case .subCategories( let id): return .requestParameters(parameters: ["cat":id], encoding: URLEncoding.queryString)
    
        }
    }
    

    
    public var validationType: ValidationType {
        return .successCodes
    }
}
