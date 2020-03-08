//
//  SubcategoryCollectionViewCellPresenter.swift
//  Recipes
//
//  Created by Александра Башкирова on 27/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Reusable
import ReactiveSwift

class SubcategoryCollectionViewCellPresenter: CellPresenter {
    let reusableClass: Reusable.Type = SubcategoryCollectionViewCell.self
    
    let name: String
    let state: MutableProperty<SubcategoryLabelState>
    
    init(name: String) {
        self.name = name
        self.state = MutableProperty.init(.base)
    }
    
    func updateState(with newState: SubcategoryLabelState) {
        print("Установлено значение \(newState)")
        state.value = newState
    }
}
