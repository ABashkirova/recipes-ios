//
//  RecipesListCellPresentersFactory.swift
//  Recipes
//
//  Created by Александра Башкирова on 04/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

class RecipesListCellPresentersFactory {
    let subcategoryCellsPresentersFactory: SubcategoryCellsPresentersFactory
    
    init(subcategoryCellsPresentersFactory: SubcategoryCellsPresentersFactory) {
        self.subcategoryCellsPresentersFactory = subcategoryCellsPresentersFactory
    }
    
    func createSubcategoriesPresenterFactory(subcategories: [Subcategory]) -> SubcategoriesTableCellPresenter {
        return SubcategoriesTableCellPresenter(
            cellPresentersFactory: subcategoryCellsPresentersFactory,
            subcategories: subcategories
        )
    }
    
    func createRecipeCellPresenterFactory(recipe: Recipe, isLiked: Bool) -> RecipeTableCellPresenter {
        return RecipeTableCellPresenter(recipe: recipe, isLiked: isLiked)
    }
}
