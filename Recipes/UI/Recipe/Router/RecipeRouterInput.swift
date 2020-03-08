//
//  RecipeRecipeRouterInput.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

import UIKit

protocol RecipeRouterInput: class {
    func close(completion: (()->Void)?)
}
