//
//  CategoriesRepositiry.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

protocol CategoryRepository {
    func getAll() -> [Category]
    func getCategory(with id: Int) -> Category?
    func getMainCategories() -> [Category]
}
