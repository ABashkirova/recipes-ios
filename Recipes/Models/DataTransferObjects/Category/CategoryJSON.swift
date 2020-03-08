//
//  CategoryJSON.swift
//  Recipes
//
//  Created by Александра Башкирова on 27/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

struct CategoryJSON: Codable {
    let id: Int
    let name: String
    let description: String
    let countOfRecipes: Int
    let recipeId: [Int]
    let subcategory: [SubcategoryJSON]?
    
    func toPlain() -> Category {
        return Category(
            id: id,
            name: name,
            imageName: "id\(id)",
            decription: description,
            countRecipes: countOfRecipes,
            recipeIds: recipeId,
            subcategories: subcategory?.map( { $0.toPlain() } ) ?? []
        )
    }
}
