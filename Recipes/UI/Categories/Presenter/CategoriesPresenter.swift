//
//  CategoriesPresenter.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import ReactiveSwift

class CategoriesPresenter {
    private let interactor: CategoriesInteractorInput
    private let router: CategoriesRouterInput
    
    let categories: [Category]
    
    let categoryCellPresenters = MutableProperty<[CategoryTableViewCellPresenter]>([])
    
    init(
        interactor: CategoriesInteractorInput,
        router: CategoriesRouterInput
    ) {
        self.interactor = interactor
        self.router = router
        
        categories = interactor.getCategories()
        
        categoryCellPresenters.value = interactor.getCellPresenters(categories: categories)
    }
}

extension CategoriesPresenter: CategoriesViewOutput {
    func didSelectRow(at index: Int) {
        guard (0..<categories.count).contains(index) else {
            return
        }
        
        router.showRecipes(at: categories[index])
    }
}
