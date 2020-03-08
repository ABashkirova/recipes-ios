//
//  SubcategoryJSON.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

struct SubcategoryJSON: Codable {
    let id: Int
    let name: String
    
    func toPlain() -> Subcategory {
        return Subcategory(id: id, name: name)
    }
}
