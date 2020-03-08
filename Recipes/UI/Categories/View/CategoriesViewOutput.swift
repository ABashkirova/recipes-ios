//
//  CategoriesViewOutput.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import ReactiveSwift

protocol CategoriesViewOutput: class {
    var categoryCellPresenters: MutableProperty<[CategoryTableViewCellPresenter]> { get }
    
    func didSelectRow(at index: Int)
}
