//
//  RecipeTableViewCell.swift
//  recipe
//
//  Created by Александра Башкирова on 02/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class RecipeTableViewCell: TableViewCell<RecipeTableCellPresenter> {

    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var servingLabel: UILabel!
    @IBOutlet weak var servingIcon: UIImageView!
    @IBOutlet weak var servingView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var roundedView: RoundedView!
    @IBOutlet weak var backInfoView: UIView!
    
    
    override func didSetup() {
        super.didSetup()
        
        guard let presenter = presenter else {
            return
        }
        
        if let imageUrl = presenter.image {
            recipeImage.setImage(with: imageUrl, placeholder: "RecipePlaceholder")
        }
        titleLabel.text = presenter.title
        summaryLabel.text = presenter.summary
        servingView.isHidden = presenter.servings == nil
        servingLabel.text = presenter.servings
        
        presenter.isLiked.producer.take(until: reuseSignal).startWithValues { [weak self] isLiked in
            self?.likeButton.isSelected = isLiked
        }
        
        //colors
        shadowView.shadowColor = AppColor.colorSupportBg
        roundedView.backgroundColor = AppColor.colorCardBg
        backInfoView.backgroundColor = AppColor.colorCardBg
        titleLabel.textColor = AppColor.colorTitle
        summaryLabel.textColor = AppColor.colorText
        servingLabel.textColor = AppColor.colorText
    }
    
    @IBAction func onLikeButton(_ sender: Any) {
        presenter?.changeLikeState()
    }
}

extension RecipeTableViewCell: HighlightingView {
}

extension RecipeTableViewCell: HighlightableCell {
    func didHighlighted() {
        highlight(view: shadowView)
    }
    
    func didUnhighlighted() {
        unhighlight(view: shadowView)
    }
}
