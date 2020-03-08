//
//  ServiceAssembly.swift
//  recipe
//
//  Created by Александра Башкирова on 02/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation
import Swinject
import RealmSwift

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Realm.self) { _ in
            return try! Realm()
        }.inObjectScope(.container)
        
        container.register(RecipeRepository.self) { r in
            return RecipeRepositoryResources()
        }
        
        container.register(CategoryRepository.self) { r in
            return CategoriesRepositoryResources()
        }
        
        container.register(FavoritesRecipeRepository.self) { r in
            return FavoritesRecipeRepositoryRealm(realm: r.resolve(Realm.self)!)
        }.inObjectScope(.container)
        
        container.register(SubcategoryCellsPresentersFactory.self) { r in
            return SubcategoryCellsPresentersFactory()
        }
        
        container.register(RecipesListCellPresentersFactory.self) { r in
            return RecipesListCellPresentersFactory(
                subcategoryCellsPresentersFactory: r.resolve(SubcategoryCellsPresentersFactory.self)!
            )
        }
        
        container.register(CategoriesCellsPresentersFactory.self) { r in
            return CategoriesCellsPresentersFactory()
        }
        
        container.register(RecipeCellsPresentersFactory.self) { r in
            return RecipeCellsPresentersFactory()
        }
        
        container.register(SettingsCellPresentersFactory.self) { r in
            return SettingsCellPresentersFactory()
        }
    }
}
