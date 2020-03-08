//
//  IngredientTableViewCell.swift
//  Recipes
//
//  Created by Александра Башкирова on 05/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class IngredientTableViewCell: TableViewCell<IngredientCellPresenter> {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    
    override func didSetup() {
        super.didSetup()
        
        guard let presenter = presenter else {
            return
        }
        
        descriptionLabel.text = presenter.description
        
        presenter.isSelected.producer.take(until: reuseSignal).skipRepeats()
            .startWithValues { [weak self] isSelected in
                guard self?.selectButton.isSelected != isSelected else {
                    return
                }
                self?.selectButton.isSelected = isSelected
            }
        contentView.backgroundColor = AppColor.colorMainBg
        descriptionLabel.textColor = AppColor.colorText
    }
    
    @IBAction func onSelectTapped(_ sender: Any) {
        presenter?.changeSelected(!selectButton.isSelected)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        guard selected else {
            return
        }
        presenter?.changeSelected(!selectButton.isSelected)
    }
}
