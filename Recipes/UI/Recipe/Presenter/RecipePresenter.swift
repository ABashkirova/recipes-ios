//
//  RecipeRecipePresenter.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

import ReactiveSwift

class RecipePresenter {
    private let interactor: RecipeInteractorInput
    private let router: RecipeRouterInput
    
    private let cellPresentersFactory: RecipeCellsPresentersFactory
    
    private let segmentDependentPresenters: [RecipeSegmentType: [CellPresenter]]
    private let segmentDependentCellPosition = 3
    
    private let updateSegmentDependentCellObserver: Signal<Int, Never>.Observer
    let updateSegmentDependentCellSignal: Signal<Int, Never>
    
    let recipeCellPresenters = MutableProperty<[[CellPresenter]]>([])
    let stepPresenters: [StepCellPresenter]
    
    let resizeSignal: Signal<(), Never>
    private let resizeObserver: Signal<(), Never>.Observer
    
    let cellUpdatedSignal: Signal<(), Never>
    private let cellUpdatedObserver: Signal<(), Never>.Observer
    
    private let recipe: Recipe
    private var isFavorite: Bool
    
    init(
        isFavorite: Bool,
        cellPresentersFactory: RecipeCellsPresentersFactory,
        interactor: RecipeInteractorInput,
        router: RecipeRouterInput,
        recipe: Recipe
    ) {
        self.isFavorite = isFavorite
        self.interactor = interactor
        self.router = router
        self.recipe = recipe
        self.cellPresentersFactory = cellPresentersFactory
        
        (updateSegmentDependentCellSignal, updateSegmentDependentCellObserver) = Signal.pipe()
        (resizeSignal, resizeObserver) = Signal.pipe()
        (cellUpdatedSignal, cellUpdatedObserver) = Signal.pipe()
        
        let recipeImageCellPresenter = cellPresentersFactory.createRecipeImageCellPresenter(
            title: recipe.name,
            image: recipe.imageRecipe,
            isLiked: isFavorite
        )
        let descriptionCellPresenter = cellPresentersFactory.createDescriptionCellPresenter(
            description: recipe.summary ?? ""
        )
        let segmentConrolPresenter = cellPresentersFactory.createSegmentControlCellPresenter(
            segmentTypeState: RecipeSegmentType.steps
        )
        let ingredients = recipe.ingredients
    
        let ingredientPresenters = ingredients.map { ingredient in
            cellPresentersFactory.createIngredientCellPresenter(description: ingredient.description)
        }
        stepPresenters = recipe.steps.map { step in cellPresentersFactory.createStepCellPresenter(step: step)
        }
        
        recipeCellPresenters.value = [
            [recipeImageCellPresenter],
            [descriptionCellPresenter],
            [segmentConrolPresenter],
            stepPresenters
        ]
        
        segmentDependentPresenters = [
            .steps: stepPresenters,
            .ingredients: ingredientPresenters
        ]
        
        for presenter in stepPresenters {
            presenter.setDelegate(self)
        }
        
        recipeImageCellPresenter.isLiked.signal.observeValues { [weak self] isLiked in
            self?.updateLikeState(likeState: isLiked)
        }
        recipeImageCellPresenter.isExpandedSteps.signal.observeValues { [weak self] isExpandedSteps in
            self?.updateExpandOfSteps(state: isExpandedSteps)
        }
        segmentConrolPresenter.segmentType.signal.observeValues { [weak self] type in
            self?.setSegmentDependentPresenter(with: type)
        }
    }
    
    private func setSegmentDependentPresenter(with type: RecipeSegmentType) {
        guard let presenter = segmentDependentPresenters[type] else { return }
        recipeCellPresenters.value[segmentDependentCellPosition] = presenter
        updateSegmentDependentCellObserver.send(value: segmentDependentCellPosition)
    }
    
    private func updateLikeState(likeState: Bool) {
        if likeState {
            interactor.setLike(for: recipe)
        } else {
            interactor.deleteLike(for: recipe)
        }
    }
    
    private func updateExpandOfSteps(state: Bool) {
        for step in stepPresenters {
            step.changeStateCell()
        }
    }
}

extension RecipePresenter: RecipeViewOutput {
    func viewIsReady() { }
    func close() {
        router.close(completion: nil)
    }
}

extension RecipePresenter: StepCellPresenterDelegate {
    func cellUpdate() {
        cellUpdatedObserver.send(value: ())
    }
}
