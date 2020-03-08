//
//  RecipeSegmentControlCellPresenter.swift
//  Recipes
//
//  Created by Александра Башкирова on 04/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Reusable
import ReactiveSwift

class RecipeSegmentControlCellPresenter: CellPresenter {
    let reusableClass: Reusable.Type = RecipeSegmentControlTableViewCell.self
    
    let segmentType: MutableProperty<RecipeSegmentType>
    
    init(segmentTypeState: RecipeSegmentType) {
        self.segmentType = MutableProperty.init(segmentTypeState)
    }
    
    func updateSegmentType(with index: Int) {
        guard let newSegmentType = RecipeSegmentType(rawValue: index) else {
            return
        }
        
        segmentType.value = newSegmentType
    }
}
