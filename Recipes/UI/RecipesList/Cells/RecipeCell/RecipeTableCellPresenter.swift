//
//  RecipeTableCellPresenter.swift
//  Recipes
//
//  Created by Александра Башкирова on 04/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit
import Reusable
import ReactiveSwift

protocol RecipeTableCellPresenterFavoritesDelegate {
    func likeState(isLiked: Bool, for recipe: Recipe)
}

class RecipeTableCellPresenter: CellPresenter {
    let reusableClass: Reusable.Type = RecipeTableViewCell.self
    
    let id: Int
    let title: String
    let summary: String
    let servings: String?
    let image: String?
    let recipe: Recipe
    let animationId: String
    
    var isLiked: MutableProperty<Bool>
    var delegate: RecipeTableCellPresenterFavoritesDelegate?
    
    init(recipe: Recipe, isLiked: Bool) {
        self.recipe = recipe
        title = recipe.name
        
        let summaryText = recipe.ingredients.map { $0.description }.joined(separator: ", ")
        
        
        summary = summaryText
        servings = recipe.servings
        image = recipe.imageRecipe
        id = recipe.id
        animationId = "recipe\(id)"
        
        self.isLiked = MutableProperty(isLiked)
    }
    
    func changeLikeState() {
        isLiked.value.toggle()
        delegate?.likeState(isLiked: isLiked.value, for: recipe)
    }
}

extension RecipeTableCellPresenter: RecipeListCellPresenter {
    var type: RecipeListCellType {
        return .recipeCell
    }
}
