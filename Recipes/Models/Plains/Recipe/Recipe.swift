//
//  Recipe.swift
//  Recipes
//
//  Created by Александра Башкирова on 28/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

struct Recipe {
    let id: Int
    let name: String
    let summary: String?
    let servings: String?
    let ingredients: [Ingredient]
    let imageRecipe: String?
    let imageIngredients: String?
    let steps: [Step]
    let createdDate: Date
    let countComments: String?
    let url: String
}

extension Recipe: Hashable {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
