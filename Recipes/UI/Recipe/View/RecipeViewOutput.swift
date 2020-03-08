//
//  RecipeRecipeViewOutput.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

import ReactiveSwift

protocol RecipeViewOutput: class {
    var recipeCellPresenters: MutableProperty<[[CellPresenter]]> { get }
    var updateSegmentDependentCellSignal: Signal<Int, Never> { get }
    var resizeSignal: Signal<(), Never> { get }
    var cellUpdatedSignal: Signal<(), Never> { get }
    /**
        @author Alexandra Bashkirova
        Notify presenter that view is ready
    */

    func viewIsReady()
    func close()
}
