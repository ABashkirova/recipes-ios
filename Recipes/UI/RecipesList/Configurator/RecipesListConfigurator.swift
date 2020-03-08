//
//  RecipesListConfigurator.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

import UIKit

class RecipesListConfigurator {
    private let cellPresentersFactory: RecipesListCellPresentersFactory
    private let categoryRepository: CategoryRepository
    private let favoritesRepository: FavoritesRecipeRepository
    private let recipeRepository: RecipeRepository
    private let recipeConfigurator: RecipeConfigurator
    
    init(
        categoryRepository: CategoryRepository,
        recipeRepository: RecipeRepository,
        favoritesRepository: FavoritesRecipeRepository,
        cellPresentersFactory: RecipesListCellPresentersFactory,
        recipeConfigurator: RecipeConfigurator
    ) {
        self.recipeRepository = recipeRepository
        self.categoryRepository = categoryRepository
        self.favoritesRepository = favoritesRepository
        self.recipeConfigurator = recipeConfigurator
        self.cellPresentersFactory = cellPresentersFactory
    }
    
    func configure(with configuration: RecipesListConfiguration) -> UIViewController {
        let router = RecipesListRouter(recipeConfigurator: recipeConfigurator)
        
        let interactor = RecipesListInteractor(
            categoryRepository: categoryRepository,
            recipeRepository: recipeRepository,
            favoritesRecipeRepository: favoritesRepository,
            cellPresentersFactory: cellPresentersFactory
        )
        let presenter = RecipesListPresenter(
            configuration: configuration,
            interactor: interactor,
            router: router
        )
        
        let viewController = RecipesListViewController(presenter: presenter)
        
        router.setViewController(viewController)
        
        if case .favorite = configuration {
            let navigationController = ListNavigationController(rootViewController: viewController, config: .default)
            router.setViewController(viewController)
            return navigationController
        }
       
        return viewController
    }
}
