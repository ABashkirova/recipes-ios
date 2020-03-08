//
//  DescriptionCellPresenter.swift
//  Recipes
//
//  Created by Александра Башкирова on 04/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Reusable

class DescriptionCellPresenter: CellPresenter {
    let reusableClass: Reusable.Type = DescriptionTableViewCell.self
    
    let description: String
    
    init(description: String) {
        self.description = description
    }
}
