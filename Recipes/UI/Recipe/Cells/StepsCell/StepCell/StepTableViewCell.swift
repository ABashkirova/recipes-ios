//
//  StepTableViewCell.swift
//  Recipes
//
//  Created by Александра Башкирова on 05/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class StepTableViewCell: TableViewCell<StepCellPresenter> {
    @IBOutlet weak var splitterView: RoundedView!
    
    @IBOutlet weak var stepImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var roundedImage: RoundedView!
    @IBOutlet weak var splitterStepView: UIStackView!

    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var mainRoundedView: RoundedView!
    @IBOutlet weak var stepRoundedView: RoundedView!
    @IBOutlet weak var roundedImageHeightConstraint: NSLayoutConstraint!
    
    override func didSetup() {
        super.didSetup()
        
        guard let presenter = presenter else {
            return
        }
        
        if let imageUrl = presenter.stepImage {
            stepImage.setImage(with: imageUrl, placeholder: "RecipePlaceholder")
        }
        
        descriptionLabel.text = presenter.description
        numberLabel.text = presenter.number
        stepLabel.text = presenter.numberStep
        
        if let description = descriptionLabel.text {
            descriptionView.isHidden = description.isEmpty
        }
        
        presenter.mode.producer.take(until: reuseSignal).skipRepeats().startWithValues { [weak self] mode in
            self?.changeState(mode: mode)
        }
        
        //colors
        mainRoundedView.backgroundColor = AppColor.colorCardBg
        numberLabel.textColor = AppColor.colorMainTheme
        splitterView.backgroundColor = AppColor.colorMainTheme
        descriptionLabel.textColor = AppColor.colorText
        stepRoundedView.backgroundColor = AppColor.colorCardBg
        stepLabel.textColor = AppColor.colorMainTheme
    }
    
    func changeState(mode: RecipeStepMode) {
        switch mode {
        case .full:
            self.roundedImage.isHidden = false
            self.splitterStepView.isHidden = true
        case .small:
            self.roundedImage.isHidden = true
            self.splitterStepView.isHidden = false
        }
    }
}
