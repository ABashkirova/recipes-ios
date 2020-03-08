//
//  RecipeRecipeInteractorInput.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

import Foundation

protocol RecipeInteractorInput: class {
    func getLikeState(for recipe: Recipe) -> Bool
    func setLike(for recipe: Recipe)
    func deleteLike(for recipe: Recipe)
}
