//
//  TabBarConfigurator.swift
//  Recipes
//
//  Created by Александра Башкирова on 13.10.2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

class TabBarConfigurator {
    
    private let categoriesConfigurator: CategoriesConfigurator
    private let favoritesConfigurator: RecipesListConfigurator
    private let settingsConfigurator: SettingsConfigurator
    
    init(
        categoriesConfigurator: CategoriesConfigurator,
        favoritesConfigurator: RecipesListConfigurator,
        settingsConfigurator: SettingsConfigurator
    ) {
        self.categoriesConfigurator = categoriesConfigurator
        self.favoritesConfigurator = favoritesConfigurator
        self.settingsConfigurator = settingsConfigurator
    }
    
    func configure() -> TabBarViewController {
        let controllers = [
            categoriesConfigurator.configure(),
            favoritesConfigurator.configure(with: RecipesListConfiguration.favorite),
            settingsConfigurator.configure()
        ]
        let tabBarController = TabBarViewController()
        tabBarController.setViewControllers(controllers, animated: false)
        
        return tabBarController
    }
}
