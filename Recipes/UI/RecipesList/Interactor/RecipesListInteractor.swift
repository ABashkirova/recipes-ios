//
//  RecipesListRecipesListInteractor.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//
import UIKit

class RecipesListInteractor {
    private let recipeRepository: RecipeRepository
    private let cellPresentersFactory: RecipesListCellPresentersFactory
    private let categoryRepository: CategoryRepository
    private let favoritesRecipeRepository: FavoritesRecipeRepository
    
    init(
        categoryRepository: CategoryRepository,
        recipeRepository: RecipeRepository,
        favoritesRecipeRepository: FavoritesRecipeRepository,
        cellPresentersFactory: RecipesListCellPresentersFactory
    ) {
        self.recipeRepository = recipeRepository
        self.favoritesRecipeRepository = favoritesRecipeRepository
        self.categoryRepository = categoryRepository
        self.cellPresentersFactory = cellPresentersFactory
    }
}

extension RecipesListInteractor: RecipesListInteractorInput {
    func getCategory(with idCategory: Int) -> Category? {
        guard let category = categoryRepository.getCategory(with: idCategory) else {
            return nil // TODO передалать на Result
        }
        
        return category
    }
    
    func getSubcategories(with idCategory: Int) -> [Subcategory] {
        guard let category = categoryRepository.getCategory(with: idCategory) else {
            return [] // TODO передалать на Result
        }
        
        return category.subcategories
    }
    
    func getCategoryName(with idCategory: Int) -> String? {
        guard let category = categoryRepository.getCategory(with: idCategory) else {
            return nil // TODO передалать на Result
        }
        
        return category.name
    }
    
    func getRecipes() -> [Recipe] {
        return recipeRepository.getAll()
    }
    
    func getRecipes(with recipesIndeficators: [Int]) -> [Recipe] {
        return recipeRepository.getAll(with: recipesIndeficators)
    }
    
    func getRecipes(by idCategory: Int) -> [Recipe] {
        guard let category = getCategory(with: idCategory) else {
            return [] // TODO передалать на Result
        }
        
        return recipeRepository.getAll(with: category.recipeIds)
    }
    
    func getFavoriteRecipes() -> [Recipe] {
        var favoritesRecipes = favoritesRecipeRepository.getAll()
        let recipes = favoritesRecipes.compactMap { recipeRepository.get(with: $0.idRecipe) }
        return recipes
    }
    
    func getCellPresenters(recipes: [Recipe]) -> [RecipeTableCellPresenter] {
        return recipes.map { [cellPresentersFactory] in
            return cellPresentersFactory.createRecipeCellPresenterFactory(recipe: $0, isLiked: getLikeState(for: $0))
        }
    }
    
    func getCellPresenters(subcategories: [Subcategory]) -> SubcategoriesTableCellPresenter {
        return cellPresentersFactory.createSubcategoriesPresenterFactory(subcategories: subcategories)
    }
    
    func getLikeState(for recipe: Recipe) -> Bool {
        guard let favoriteRecipe = favoritesRecipeRepository.get(id: recipe.id) else {
            return false
        }
        return favoriteRecipe.isFavorites
    }
    
    func setLike(for recipe: Recipe) {
        favoritesRecipeRepository.update(id: recipe.id, isFavorite: true, dateUpdate: Date())
    }
    
    func deleteLike(for recipe: Recipe) {
        guard let favoriteRecipe = favoritesRecipeRepository.get(id: recipe.id) else {
            return
        }
        favoritesRecipeRepository.delete(favoritesRecipe: favoriteRecipe)
    }
}
