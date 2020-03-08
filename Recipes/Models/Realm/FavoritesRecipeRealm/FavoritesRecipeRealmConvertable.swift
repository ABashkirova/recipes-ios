//
//  FavoritesRecipeRealmConvertable.swift
//  Recipes
//
//  Created by Александра Башкирова on 31/08/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

extension FavoritesRecipeRealm: RealmConvertable {
    typealias T = FavoritesRecipe
    
    func fromPlain(_ plain: FavoritesRecipe) {
        id = plain.idRecipe
        isFavorites = plain.isFavorites
        dateUpdate = plain.dateUpdate
    }
    
    func toPlain() -> T {
        return FavoritesRecipe(idRecipe: id, isFavorites: isFavorites, dateUpdate: dateUpdate)
    }
}
