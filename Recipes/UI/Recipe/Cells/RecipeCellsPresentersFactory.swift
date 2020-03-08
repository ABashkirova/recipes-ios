//
//  RecipeCellsPresentersFactory.swift
//  Recipes
//
//  Created by Александра Башкирова on 04/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class RecipeCellsPresentersFactory {
    func createSegmentControlCellPresenter(segmentTypeState: RecipeSegmentType) -> RecipeSegmentControlCellPresenter {
        return RecipeSegmentControlCellPresenter(segmentTypeState: segmentTypeState)
    }
    
    func createDescriptionCellPresenter(description: String) -> DescriptionCellPresenter {
        return DescriptionCellPresenter(description: description)
    }
    
    func createRecipeImageCellPresenter(title: String, image: String?, isLiked: Bool) -> RecipeImageCellPresenter {
        return RecipeImageCellPresenter(title: title, image: image, isLiked: isLiked)
    }
    
    func createStepCellPresenter(step: Step) -> StepCellPresenter {
        return StepCellPresenter(step: step)
    }
    
    func createIngredientCellPresenter(description: String) -> IngredientCellPresenter {
        return IngredientCellPresenter(description: description)
    }
}
