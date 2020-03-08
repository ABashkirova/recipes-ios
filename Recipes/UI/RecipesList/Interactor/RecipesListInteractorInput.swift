//
//  RecipesListRecipesListInteractorInput.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

import Foundation

protocol RecipesListInteractorInput: class {
    func getRecipes(by idCategory: Int) -> [Recipe]
    func getRecipes(with recipesIndeficators: [Int]) -> [Recipe]
    func getRecipes() -> [Recipe]
    func getCellPresenters(recipes: [Recipe]) -> [RecipeTableCellPresenter]
    
    func getCategory(with idCategory: Int) -> Category?
    func getCategoryName(with idCategory: Int) -> String?
    
    func getSubcategories(with idCategory: Int) -> [Subcategory]
    func getCellPresenters(subcategories: [Subcategory]) -> SubcategoriesTableCellPresenter
    
    func getFavoriteRecipes() -> [Recipe]
    func getLikeState(for recipe: Recipe) -> Bool
    func setLike(for recipe: Recipe)
    func deleteLike(for recipe: Recipe)
}
