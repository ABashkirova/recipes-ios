//
//  CategoriesRouter.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class CategoriesRouter {
    private weak var viewController: UIViewController?
    private var recipeListConfigurator: RecipesListConfigurator
    
    init(recipeListConfigurator: RecipesListConfigurator) {
        self.recipeListConfigurator = recipeListConfigurator
    }
    
    func setViewController(_ vc: UIViewController) {
        viewController = vc
    }
}

extension CategoriesRouter: CategoriesRouterInput {
    func showRecipes(at category: Category) {
        viewController?.navigationController?.pushViewController(
            recipeListConfigurator.configure(with: .category(category: category)),
            animated: true
        )
    }
}

