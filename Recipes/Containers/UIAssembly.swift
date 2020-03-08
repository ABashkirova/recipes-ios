//
//  UIAssembly.swift
//  recipe
//
//  Created by Александра Башкирова on 02/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation
import Swinject

class UIAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RecipeConfigurator.self) { r in
            return RecipeConfigurator(
                favoritesRepository: r.resolve(FavoritesRecipeRepository.self)!,
                cellPresentersFactory: r.resolve(RecipeCellsPresentersFactory.self)!
            )
        }
        
        container.register(RecipesListConfigurator.self) { r in
            return RecipesListConfigurator(
                categoryRepository: r.resolve(CategoryRepository.self)!,
                recipeRepository: r.resolve(RecipeRepository.self)!,
                favoritesRepository: r.resolve(FavoritesRecipeRepository.self)!,
                cellPresentersFactory: r.resolve(RecipesListCellPresentersFactory.self)!,
                recipeConfigurator: r.resolve(RecipeConfigurator.self)!
            )
        }
        
        container.register(CategoriesConfigurator.self) { r in
            return CategoriesConfigurator(
                categoryRepository: r.resolve(CategoryRepository.self)!,
                cellPresentersFactory: r.resolve(CategoriesCellsPresentersFactory.self)!,
                recipeListConfigurator: r.resolve(RecipesListConfigurator.self)!
            )
        }
        
        container.register(SettingsConfigurator.self) { r in
            return SettingsConfigurator(
                settingsCellPresentersFactory: r.resolve(SettingsCellPresentersFactory.self)!
            )
        }
        
        container.register(TabBarConfigurator.self) { r in
            return TabBarConfigurator(
                categoriesConfigurator: r.resolve(CategoriesConfigurator.self)!,
                favoritesConfigurator: r.resolve(RecipesListConfigurator.self)!,
                settingsConfigurator: r.resolve(SettingsConfigurator.self)!
            )
        }
    }
}
