//
//  DescriptionTableViewCell.swift
//  Recipes
//
//  Created by Александра Башкирова on 04/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: TableViewCell<DescriptionCellPresenter> {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func didSetup() {
        super.didSetup()
        
        guard let presenter = presenter else {
            return
        }
        
        descriptionLabel.text = presenter.description
        descriptionLabel.textColor = AppColor.colorText
    }
}
