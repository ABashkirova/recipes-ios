//
//  RecipesListRecipesListRouterInput.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

protocol RecipesListRouterInput {
    func showRecipe(recipe: Recipe, isLiked: Bool, animationId: String)
}
