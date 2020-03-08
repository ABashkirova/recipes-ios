//
//  BlocksIngredientsJSON.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

struct BlocksIngredientsJSON: Codable {
    let title: String
    let ingredients: [IngredientJSON]
    
    func toPlain() -> BlockIngredients {
        return BlockIngredients(
            title: title,
            ingredients: ingredients.map({ $0.toPlain() })
        )
    }
}
