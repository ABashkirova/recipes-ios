//
//  RecipeConfigurator.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

import UIKit

class RecipeConfigurator {
   
    private let cellPresentersFactory: RecipeCellsPresentersFactory
    private let favoritesRepository: FavoritesRecipeRepository
    init(
        favoritesRepository: FavoritesRecipeRepository,
        cellPresentersFactory: RecipeCellsPresentersFactory
    ) {
        self.favoritesRepository = favoritesRepository
        self.cellPresentersFactory = cellPresentersFactory
    }
    
    func configure(recipe: Recipe, isLiked: Bool) -> UIViewController {
    
        let router = RecipeRouter()

        let interactor = RecipeInteractor(favoritesRepository: favoritesRepository)

        let presenter = RecipePresenter(
            isFavorite: isLiked,
            cellPresentersFactory: cellPresentersFactory,
            interactor: interactor,
            router: router,
            recipe: recipe
        )
        
        let viewController = RecipeViewController(presenter: presenter)
        router.setViewController(viewController)
        
        return viewController
    }
}
