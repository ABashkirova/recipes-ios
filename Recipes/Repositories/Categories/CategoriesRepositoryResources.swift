//
//  CategoriesRepositoryResources.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

class CategoriesRepositoryResources {
    var categories: [Category] = []
    
    init() {
        categories = getAll()
    }
}

extension CategoriesRepositoryResources: CategoryRepository {
    func getCategory(with id: Int) -> Category? {
        guard let category = categories.first(where: {$0.id == id}) else { return nil }
        
        return category
    }
    
    func getMainCategories() -> [Category] {
        let mainCategories = categories.filter({ (38...50).contains($0.id) })
        return mainCategories
    }
    
    func getAll() -> [Category] {
        if categories.isEmpty {
            if let url = Bundle.main.url(forResource: "categories", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode([CategoryJSON].self, from: data)
                    categories = jsonData.map({ $0.toPlain() })
                } catch {
                    print("error:\(error)")
                }
            }
        }
        return categories
    }
}
