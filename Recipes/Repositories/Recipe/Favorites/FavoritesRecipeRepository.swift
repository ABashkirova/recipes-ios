//
//  FavoritesRecipeRepository.swift
//  Recipes
//
//  Created by Александра Башкирова on 31/08/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

enum FavoritesRecipeRepositoryError: Error {
    case writeError
    case notFound
}

protocol FavoritesRecipeRepository {
    func get(id: Int) -> FavoritesRecipe?
    func update(id: Int, isFavorite: Bool, dateUpdate: Date) -> Result<FavoritesRecipe, FavoritesRecipeRepositoryError>
    func delete(favoritesRecipe: FavoritesRecipe) -> Result<(), FavoritesRecipeRepositoryError>
    func getAll() -> [FavoritesRecipe]
}
