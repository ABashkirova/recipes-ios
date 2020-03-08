//
//  SubcategoryCellsPresentersFactory.swift
//  Recipes
//
//  Created by Александра Башкирова on 27/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

class SubcategoryCellsPresentersFactory {
    func createSubcategoryCellPresenter(
        subcategory: Subcategory
    ) -> SubcategoryCollectionViewCellPresenter {
        return SubcategoryCollectionViewCellPresenter(name: subcategory.name)
    }
}
