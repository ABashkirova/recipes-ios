//
//  RecipeJSON.swift
//  recipe
//
//  Created by Александра Башкирова on 02/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

struct RecipeJSON: Codable {
    let id: Int
    let name: String
    let summary: String?
    let servings: String?
    let ingredients: [IngredientJSON]
    let imageRecipe: String?
    let imageIngredients: String?
    let steps: [StepJSON]
    let createdDate: String
    let countComments: String?
    let url: String
    let categories: [Int]
    
    func toPlain() -> Recipe {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.mm.yyyy"
        let date = dateFormatter.date(from: createdDate) ?? Date()
        return Recipe(
            id: id,
            name: name,
            summary: summary,
            servings: servings,
            ingredients: ingredients.map( { $0.toPlain() }),
            imageRecipe: imageRecipe,
            imageIngredients: imageIngredients,
            steps: steps.map({ $0.toPlain() }),
            createdDate: date,
            countComments: countComments,
            url: url
        )
    }
}
