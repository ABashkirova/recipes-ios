//
//  IngredientCellPresenter.swift
//  Recipes
//
//  Created by Александра Башкирова on 05/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Reusable
import ReactiveSwift

class IngredientCellPresenter: CellPresenter {
    let reusableClass: Reusable.Type = IngredientTableViewCell.self
    var isSelected: MutableProperty<Bool>
    let description: String
    
    init(description: String) {
        self.description = description
        isSelected = MutableProperty(false)
    }
    
    func changeSelected(_ isSelecte: Bool) {
        isSelected.value = isSelecte
    }
}
