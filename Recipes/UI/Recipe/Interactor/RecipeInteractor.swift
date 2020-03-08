//
//  RecipeRecipeInteractor.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//
import UIKit

class RecipeInteractor {
    private let favoritesRepository: FavoritesRecipeRepository
    
    init(favoritesRepository: FavoritesRecipeRepository) {
        self.favoritesRepository = favoritesRepository
    }
}

extension RecipeInteractor: RecipeInteractorInput {
    func getLikeState(for recipe: Recipe) -> Bool {
        guard let favoriteRecipe = favoritesRepository.get(id: recipe.id) else {
            return false
        }
        return favoriteRecipe.isFavorites
    }
    
    func setLike(for recipe: Recipe) {
        favoritesRepository.update(id: recipe.id, isFavorite: true, dateUpdate: Date())
    }
    
    func deleteLike(for recipe: Recipe) {
        guard let favoriteRecipe = favoritesRepository.get(id: recipe.id) else {
            return
        }
        favoritesRepository.delete(favoritesRecipe: favoriteRecipe)
    }
}
