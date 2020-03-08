//
//  RecipesListRecipesListRouter.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//
import UIKit

class RecipesListRouter {
    private weak var viewController: UIViewController?
    private let recipeConfigurator: RecipeConfigurator
    
    init(recipeConfigurator: RecipeConfigurator) {
        self.recipeConfigurator = recipeConfigurator
    }
    
    func setViewController(_ vc: UIViewController) {
        viewController = vc
    }
}

extension RecipesListRouter: RecipesListRouterInput {
    func showRecipe(recipe: Recipe, isLiked: Bool, animationId: String) {
        viewController?.present(
            recipeConfigurator.configure(
                recipe: recipe,
                isLiked: isLiked
            ),
            animated: true,
            completion: nil
        )
    }
}
