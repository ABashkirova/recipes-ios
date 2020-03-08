//
//  StepCellPresenter.swift
//  Recipes
//
//  Created by Александра Башкирова on 05/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Reusable
import ReactiveSwift

class StepCellPresenter: CellPresenter {
    
    var reusableClass: Reusable.Type = StepTableViewCell.self
    let description: String?
    let stepImage: String?
    let number: String
    let numberStep: String
    let mode: MutableProperty<RecipeStepMode>
    
    private weak var delegate: StepCellPresenterDelegate?
    
    init(step: Step) {
        self.description = step.description
        self.stepImage = step.image
        self.number = step.number
        self.numberStep = localize(key: "Step") + " \(self.number)"
        self.mode = MutableProperty(.full)
        
        if let sImage = stepImage, sImage.isEmpty {
            self.mode.value = .small
        }
    }
    
    func changeStateCell() {
        if isSelecteble() {
            mode.value.toggle()
            delegate?.cellUpdate()
        }
    }
    
    func setDelegate(_ delegate: StepCellPresenterDelegate) {
        self.delegate = delegate
    }
    
    private func isSelecteble() -> Bool {
        return stepImage?.isEmpty == false && description?.isEmpty == false
    }
}

protocol StepCellPresenterDelegate: class {
    func cellUpdate()
}
