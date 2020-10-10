//
//  Recipes.swift
//  Foodi
//
//  Created by 3bdo on 10/9/20.
//  Copyright © 2020 3bdo. All rights reserved.
//

import Foundation
import Moya

enum RecipeNetworking {
    
    static private let appID = "6a9f3978"
    static private let appKey = "cbe353840e12af609b49d9feb3f35d25"
    
    case searchRecipe(query: String)
}

extension RecipeNetworking: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.edamam.com/api/food-database/v2/") else {
            fatalError("Error in base url: https://api.edamam.com/food-database/v2/")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .searchRecipe:
            return "parser"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .searchRecipe(let query):
            return .requestParameters(parameters: ["ingr": query,"app_id": RecipeNetworking.appID, "app_key": RecipeNetworking.appKey], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
