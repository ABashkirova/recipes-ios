//
//  CategoriesRouterInput.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

protocol CategoriesRouterInput: class {
    func showRecipes(at category: Category)
}
