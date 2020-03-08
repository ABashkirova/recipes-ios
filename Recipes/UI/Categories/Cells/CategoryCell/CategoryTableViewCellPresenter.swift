//
//  CategoryTableViewCellPresenter.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Reusable

class CategoryTableViewCellPresenter: CellPresenter {
    
    let reusableClass: Reusable.Type = CategoryTableViewCell.self
    
    let imageName: String?
    let title: String
    
    init(category: Category) {
        title = category.name
        imageName = category.imageName
    }
}
