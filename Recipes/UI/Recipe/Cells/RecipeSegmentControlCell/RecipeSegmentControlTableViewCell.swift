//
//  RecipeSegmentControlTableViewCell.swift
//  Recipes
//
//  Created by Александра Башкирова on 04/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class RecipeSegmentControlTableViewCell: TableViewCell<RecipeSegmentControlCellPresenter>  {

    @IBOutlet weak var recipeControl: UISegmentedControl!
    
    override func didSetup() {
        super.didSetup()
        
        guard let presenter = presenter else { return }
        
        recipeControl.layer.cornerRadius = 4.0;
        recipeControl.clipsToBounds = true;
        
        presenter.segmentType.producer.take(until: reuseSignal)
            .startWithValues { [weak self] segmentType in
                guard
                    segmentType.rawValue == self?.recipeControl.selectedSegmentIndex
                else
                {
                    return
                }
                self?.recipeControl.selectedSegmentIndex = segmentType.rawValue
        }
        
        recipeControl.tintColor = AppColor.colorMainTheme
        if #available(iOS 13.0, *) {
            recipeControl.selectedSegmentTintColor = AppColor.colorMainTheme
        }
        
        recipeControl.backgroundColor = AppColor.colorSupportBg
    }
    
    private func localize() {
        RecipeSegmentType.allCases.forEach { [weak self] segmentType in
            self?.recipeControl.setTitle(segmentType.title, forSegmentAt: segmentType.rawValue)
        }
    }
    
    @IBAction func onSelectedSegment(_ sender: Any) {
        presenter?.updateSegmentType(with: recipeControl.selectedSegmentIndex)
    }
}

private extension RecipeSegmentType {
    var title: String {
        switch self {
        case .ingredients:
            return localize(key: "Ingredients")
        case .steps:
            return localize(key: "Recipe")
        }
    }
}
