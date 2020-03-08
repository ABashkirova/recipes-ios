//
//  RecipeImageTableViewCell.swift
//  Recipes
//
//  Created by Александра Башкирова on 04/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class RecipeImageTableViewCell: TableViewCell<RecipeImageCellPresenter> {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var roundedView: RoundedView!
    @IBOutlet weak var expandStepsButton: UIButton!
    
    override func didSetup() {
        super.didSetup()
        
        guard let presenter = presenter else { return }
        
        if let imageUrl = presenter.image {
            recipeImage.setImage(with: imageUrl, placeholder: "RecipePlaceholder")
        }
        titleLabel.text = presenter.title
        
        presenter.isLiked.producer.take(until: reuseSignal).startWithValues{ [weak self] isLiked in
            self?.likeButton.isSelected = isLiked 
        }
        
        roundedView.backgroundColor = AppColor.colorMainBg
        titleLabel.textColor = AppColor.colorTitle
    }
    
    @IBAction func onLikeButton(_ sender: Any) {
        presenter?.changeLikeState()
    }
    
    @IBAction func onTapExpandButton(_ sender: Any) {
        presenter?.expandStepsState()
    }
}
