//
//  RecipesListRecipesListPresenter.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

import ReactiveSwift

class RecipesListPresenter {
    let interactor: RecipesListInteractorInput
    let router: RecipesListRouterInput
    let configuration: RecipesListConfiguration
    
    var recipeCellPresenters: [RecipeTableCellPresenter] = []
    var subcategoriesCellPresenter: SubcategoriesTableCellPresenter? = nil
    let recipeListCellPresenters = MutableProperty<[RecipeListCellPresenter]>([])
    
    var title: String?
    var recipes: [Recipe]
    var filteredRecipes: [Recipe]
    var subcategories: [Subcategory]
    var selectedSubcategories: [Subcategory] = []
    var searchText: String = ""
    
    init(
        configuration: RecipesListConfiguration,
        interactor: RecipesListInteractorInput,
        router: RecipesListRouterInput
    ) {
        self.interactor = interactor
        self.router = router
        self.configuration = configuration
       
        switch configuration {
        case .category(let category):
            let idCategory = category.id
            
            title = interactor.getCategoryName(with: idCategory)
            subcategories = interactor.getSubcategories(with: idCategory)
            recipes = interactor
                .getRecipes(by: idCategory)
                .sorted(by: { $0.createdDate.compare($1.createdDate) == .orderedDescending })
            
        case .favorite:
            title = localize(key: "Favorites")
            subcategories = []
            recipes = interactor.getFavoriteRecipes()
        }
        
        filteredRecipes = recipes
        
        if !subcategories.isEmpty {
            subcategoriesCellPresenter = interactor.getCellPresenters(subcategories: subcategories)
            
            subcategoriesCellPresenter?.seletectedSubcategories.signal.observeValues { [weak self] subcategories in
                self?.selectedSubcategories = subcategories
                self?.filterRecipes()
                self?.updatePresenters()
    
            }
        }
        
        updatePresenters()
    }
    
    private func getRecipeCellPresenters(recipes: [Recipe]) -> [RecipeTableCellPresenter] {
        let cellPreseneters = interactor.getCellPresenters(recipes: recipes)

        cellPreseneters.forEach { presenter in
            presenter.delegate = self
        }

        return cellPreseneters
    }
    
    private func filterRecipes() {
        filteredRecipes = recipes
        if !selectedSubcategories.isEmpty {
            let recipesFromCategories = selectedSubcategories.map { interactor.getRecipes(by: $0.id) }
            var recipesSet: Set<Recipe> = Set(recipesFromCategories.elementOrNil(index: 0) ?? [])
            
            for recipes in recipesFromCategories {
                recipesSet.formIntersection(recipes)
            }
            
            filteredRecipes = Array(recipesSet)
                .sorted(by: { $0.createdDate.compare($1.createdDate) == .orderedDescending })
        }
        
        if !searchText.isEmpty {
            var searchedRecipes: [Recipe] = []
            for recipe in filteredRecipes {
                if recipe.name.lowercased().contains(searchText.lowercased()) {
                    searchedRecipes.append(recipe)
                }
            }
            filteredRecipes = searchedRecipes
        }
    }
    
    private func updatePresenters() {
        var cellPresenters: [RecipeListCellPresenter] = []
        recipeCellPresenters = getRecipeCellPresenters(recipes: filteredRecipes)
        
        if let subcategoriesCellPresenter = subcategoriesCellPresenter {
            cellPresenters.append(subcategoriesCellPresenter)
        }
        cellPresenters.append(contentsOf: recipeCellPresenters)
        recipeListCellPresenters.value = cellPresenters
    }
}

extension RecipesListPresenter: RecipesListViewOutput {
    func viewWillAppear() {
        updatePresenters()
        recipeCellPresenters.forEach { presenter in
            presenter.isLiked.value = interactor.getLikeState(for: presenter.recipe)
        }
    }
    
    func didSelectRow(at index: Int) {
        switch recipeListCellPresenters.value[index].type {
        case .recipeCell:
            let recipePresenter = recipeListCellPresenters.value[index] as! RecipeTableCellPresenter
            router.showRecipe(
                recipe: recipePresenter.recipe,
                isLiked: recipePresenter.isLiked.value,
                animationId: recipePresenter.animationId
            )
        case .subcategoriesCell:
            print("Подкатегории выбрали") // TODO раскрыть список подкатегорий
        }
    }
    
    func didChangeSearch(text: String?) {
        searchText = text ?? ""
        filterRecipes()
        updatePresenters()
    }
}

extension RecipesListPresenter: RecipeTableCellPresenterFavoritesDelegate {
    func likeState(isLiked: Bool, for recipe: Recipe) {
        if isLiked {
            interactor.setLike(for: recipe)
        } else {
            interactor.deleteLike(for: recipe)
        }
    }
}
