//
//  CategoriesCellsPresentersFactory.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

class CategoriesCellsPresentersFactory {
    func createCategoryCellPresenter(category: Category) -> CategoryTableViewCellPresenter {
        return CategoryTableViewCellPresenter(category: category)
    }
}
