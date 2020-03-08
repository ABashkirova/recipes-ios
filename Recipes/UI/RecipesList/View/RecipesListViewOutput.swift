//
//  RecipesListRecipesListViewOutput.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol RecipesListViewOutput: class {
    var recipeListCellPresenters: MutableProperty<[RecipeListCellPresenter]> { get }
    var title: String? { get }
    /**
        @author Alexandra Bashkirova
        Notify presenter that view is ready
    */

    func didSelectRow(at index: Int)
    func didChangeSearch(text: String?)
    func viewWillAppear()
}
