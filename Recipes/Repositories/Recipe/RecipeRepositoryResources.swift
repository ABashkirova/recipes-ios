//
//  RecipeRepositoryResources.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class RecipeRepositoryResources {
    var recipes: [Recipe] = []
    init() {
        recipes = getAll()
    }
}

extension RecipeRepositoryResources: RecipeRepository {
    func get(with idRecipe: Int) -> Recipe? {
        guard let recipe = recipes.first(where: {$0.id == idRecipe}) else { return nil }
        // TODO переделать на result
        return recipe
    }
    
    func getAll(with ids: [Int]) -> [Recipe] {
        var recipesResult: [Recipe] = []
        for id in ids {
            if let recipe = recipes.first(where: {$0.id == id}) {
                recipesResult.append(recipe)
            }
        }
        return recipesResult
    }
    
    func getAll() -> [Recipe] {
        
        if recipes.isEmpty {
            if let url = Bundle.main.url(forResource: "recipes", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode([RecipeJSON].self, from: data)
                    recipes = jsonData.map( { $0.toPlain() })
                } catch {
                    print("error:\(error)")
                }
            }
        }
        
        return recipes
    }
}
