//
//  Recipe.swift
//  Foodi
//
//  Created by 3bdo on 10/9/20.
//  Copyright © 2020 3bdo. All rights reserved.
//

import Foundation
struct Recipe: Codable {
    let hints : [Hint]
}

struct Hint: Codable {
    let food: Food?
}

struct Food: Codable {
    let foodId : String
    let label : String
    let nutrients : Nutrients?
    let category : String
    let image : String?
}

struct Nutrients: Codable {
    let enercKcal : Float?
    let procnt : Float?
    let fat : Float?
    let chocdf : Float?
    let fibtg: Float?
    let sugre: Float?
    
    enum CodingKeys: String, CodingKey {
        case enercKcal = "ENERC_KCAL"
        case procnt = "PROCNT"
        case fat = "FAT"
        case chocdf = "CHOCDF"
        case fibtg = "FIBTG"
        case sugre = "SUGAR"
    }
}
