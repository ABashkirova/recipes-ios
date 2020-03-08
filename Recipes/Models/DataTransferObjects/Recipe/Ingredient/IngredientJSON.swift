//
//  IngredientJSON.swift
//  recipe
//
//  Created by Александра Башкирова on 02/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

struct IngredientJSON: Codable {
    let description: String
    let count: String?
    let unit: String?
    let productId: Int?
    
    func toPlain() -> Ingredient {
        return Ingredient(description: description, count: count, unit: unit, productId: productId)
    }
}
