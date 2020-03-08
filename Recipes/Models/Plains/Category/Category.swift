//
//  Category.swift
//  recipe
//
//  Created by Александра Башкирова on 02/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

struct Category {
    let id: Int
    let name: String
    let imageName: String?
    let decription: String
    let countRecipes: Int
    let recipeIds: [Int]
    let subcategories: [Subcategory]
}
