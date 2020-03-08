//
//  SubcategoriesTableCellPresenter.swift
//  Recipes
//
//  Created by Александра Башкирова on 26/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Reusable
import ReactiveSwift

class SubcategoriesTableCellPresenter: CellPresenter {
    let reusableClass: Reusable.Type = SubcategoriesTableViewCell.self
    
    private let cellPresentersFactory: SubcategoryCellsPresentersFactory
    let subcategoryCellPresenters = MutableProperty<[SubcategoryCollectionViewCellPresenter]>([])
    
    let subcategories: [Subcategory]
    var seletectedSubcategories = MutableProperty<[Subcategory]>([])
    
    init(cellPresentersFactory: SubcategoryCellsPresentersFactory, subcategories: [Subcategory]) {
        self.subcategories = subcategories
        self.cellPresentersFactory = cellPresentersFactory
        
        subcategoryCellPresenters.value = subcategories.map { [cellPresentersFactory] subcategory in
            cellPresentersFactory.createSubcategoryCellPresenter(subcategory: subcategory)
        }
    }
}

extension SubcategoriesTableCellPresenter: RecipeListCellPresenter {
    var type: RecipeListCellType {
        return .subcategoriesCell
    }
    
    func didSelectRow(at index: Int) {
        guard (0..<subcategories.count).contains(index) else {
            return
        }
        
        let newState: SubcategoryLabelState = subcategoryCellPresenters.value[index].state.value == .base ? .selected : .base
        subcategoryCellPresenters.value[index].state.value = newState
        
        switch subcategoryCellPresenters.value[index].state.value {
        case .base:
            seletectedSubcategories.value.removeAll(where: { $0.id == subcategories[index].id })
        case .selected:
            seletectedSubcategories.value.append(subcategories[index])
        }
    }
}
