//
//  RecipeStepMode.swift
//  Recipes
//
//  Created by Александра Башкирова on 25/08/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

enum RecipeStepMode {
    case full
    case small
    
    mutating func toggle() {
        switch self {
        case .full:
            self = .small
        case .small:
            self = .full
        }
    }
}
