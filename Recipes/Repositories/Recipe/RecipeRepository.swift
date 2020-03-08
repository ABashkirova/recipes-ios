//
//  RecipeRepository.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

protocol RecipeRepository {
    func getAll() -> [Recipe]
    func getAll(with ids: [Int]) -> [Recipe]
    func get(with idRecipe: Int) -> Recipe?
}
