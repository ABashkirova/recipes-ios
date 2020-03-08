//
//  FavoritesRecipeRepositoryRealm.swift
//  Recipes
//
//  Created by Александра Башкирова on 31/08/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation
import RealmSwift

class FavoritesRecipeRepositoryRealm {
    let realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
}

extension FavoritesRecipeRepositoryRealm: FavoritesRecipeRepository {
    func get(id: Int) -> FavoritesRecipe? {
        let favoritesRecipeRealm = realm.objects(FavoritesRecipeRealm.self).filter("id == %d", id)
        let favoritesRecipe = favoritesRecipeRealm.first?.toPlain()
        return favoritesRecipe
    }
    
    func update(
        id: Int,
        isFavorite: Bool,
        dateUpdate: Date
    ) -> Result<FavoritesRecipe, FavoritesRecipeRepositoryError> {
        let favoritesRecipe = FavoritesRecipe(idRecipe: id, isFavorites: isFavorite, dateUpdate: dateUpdate)
        let favoritesRecipeRealm = FavoritesRecipeRealm()
        favoritesRecipeRealm.fromPlain(favoritesRecipe)
        do {
            realm.beginWrite()
            realm.add(favoritesRecipeRealm, update: .modified)
            try realm.commitWrite()
            return .success(favoritesRecipe)
        }
        catch {
            return .failure(.writeError)
        }
    }
    
    func delete(favoritesRecipe: FavoritesRecipe) -> Result<(), FavoritesRecipeRepositoryError> {
        guard let favoritesRecipeRealm = realm.object(ofType: FavoritesRecipeRealm.self, forPrimaryKey: favoritesRecipe.idRecipe) else {
            return .failure(.notFound)
        }
        
        do {
            realm.beginWrite()
            realm.delete(favoritesRecipeRealm)
            try realm.commitWrite()
            return .success(())
        }
        catch {
            return .failure(.writeError)
        }
    }
    
    func getAll() -> [FavoritesRecipe] {
        let favoritesRecipesRealm = realm.objects(FavoritesRecipeRealm.self).filter("isFavorites == true")
        let favoritesRecipes: [FavoritesRecipe] = favoritesRecipesRealm.map { favorites in favorites.toPlain() }
        return favoritesRecipes
    }
}

