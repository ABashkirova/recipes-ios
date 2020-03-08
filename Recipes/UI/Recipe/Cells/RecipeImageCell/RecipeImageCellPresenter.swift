//
//  RecipeImageCellPresenter.swift
//  Recipes
//
//  Created by Александра Башкирова on 04/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit
import Reusable
import ReactiveSwift

class RecipeImageCellPresenter: CellPresenter {
    let reusableClass: Reusable.Type = RecipeImageTableViewCell.self
    
    let image: String? // TODO: добавить обработку, если image нет
    let title: String
    var isLiked: MutableProperty<Bool>
    var isExpandedSteps: MutableProperty<Bool>
    
    init(title: String, image: String?, isLiked: Bool) {
        self.image = image
        self.title = title
        self.isLiked = MutableProperty(isLiked)
        self.isExpandedSteps = MutableProperty(true)
    }
    
    func changeLikeState() {
        isLiked.value.toggle()
    }
    
    func expandStepsState() {
        isExpandedSteps.value.toggle()
    }
}
