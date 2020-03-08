//
//  RecipeRecipeRouter.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//
import UIKit

class RecipeRouter {
    private weak var viewController: UIViewController?
    
    func setViewController(_ vc: UIViewController) {
        viewController = vc
    }
}

extension RecipeRouter: RecipeRouterInput {
    func close(completion: (()->Void)?) {
        viewController?.dismiss(animated: true, completion: completion)
    }
}
