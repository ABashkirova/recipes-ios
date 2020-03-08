//
//  CategoriesInteractorInput.swift
//  Recipes
//
//  Created by Chernousov Alexander on 20/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

protocol CategoriesInteractorInput: class {
    func getCategories() -> [Category]
    func getCellPresenters(categories: [Category]) -> [CategoryTableViewCellPresenter]
}
