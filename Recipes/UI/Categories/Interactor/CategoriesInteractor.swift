//
//  CategoriesInteractor.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

class CategoriesInteractor {
    private let cellPresentersFactory: CategoriesCellsPresentersFactory
    private let categoryRepository: CategoryRepository
    
    init(
        categoryRepository: CategoryRepository,
        cellPresentersFactory: CategoriesCellsPresentersFactory
    ) {
        self.categoryRepository = categoryRepository
        self.cellPresentersFactory = cellPresentersFactory
    }
}

extension CategoriesInteractor: CategoriesInteractorInput {
    func getCategories() -> [Category] {
        return categoryRepository.getMainCategories()
    }
    
    func getCellPresenters(categories: [Category]) -> [CategoryTableViewCellPresenter] {
        return categories.map { [cellPresentersFactory] in
            cellPresentersFactory.createCategoryCellPresenter(category: $0)
        }
    }
}
