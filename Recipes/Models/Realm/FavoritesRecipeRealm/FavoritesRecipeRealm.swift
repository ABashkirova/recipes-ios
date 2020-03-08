//
//  FavoritesRecipeRealm.swift
//  Recipes
//
//  Created by Александра Башкирова on 31/08/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation
import RealmSwift

class FavoritesRecipeRealm: Object  {
    @objc dynamic var id: Int = 0
    @objc dynamic var isFavorites: Bool = false
    @objc dynamic var dateUpdate: Date = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
