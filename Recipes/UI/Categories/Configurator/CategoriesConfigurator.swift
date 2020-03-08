//
//  CategoriesConfigurator.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class CategoriesConfigurator {
    
    private let cellPresentersFactory: CategoriesCellsPresentersFactory
    private let categoryRepository: CategoryRepository
    private let recipeListConfigurator: RecipesListConfigurator
    
    init(
        categoryRepository: CategoryRepository,
        cellPresentersFactory: CategoriesCellsPresentersFactory,
        recipeListConfigurator: RecipesListConfigurator
    ) {
        self.categoryRepository = categoryRepository
        self.cellPresentersFactory = cellPresentersFactory
        self.recipeListConfigurator = recipeListConfigurator
    }
    
    func configure() -> UIViewController {
        
        let router = CategoriesRouter(recipeListConfigurator: recipeListConfigurator)
        
        let interactor = CategoriesInteractor(
            categoryRepository: categoryRepository,
            cellPresentersFactory: cellPresentersFactory
        )
        
        let presenter = CategoriesPresenter(interactor: interactor, router: router)
        
        let viewController = CategoriesViewController(presenter: presenter)
    
        let navigationController = ListNavigationController(rootViewController: viewController, config: .default)
        
        router.setViewController(viewController)
        return navigationController
    }
}
