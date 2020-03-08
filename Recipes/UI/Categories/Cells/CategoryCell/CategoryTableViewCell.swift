//
//  CategoryTableViewCell.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class CategoryTableViewCell: TableViewCell<CategoryTableViewCellPresenter> {

    @IBOutlet weak var roundedView: RoundedView!
    @IBOutlet weak var categoryImage: UIImageView!

    @IBOutlet weak var label: UILabel!
    
    override func didSetup() {
        super.didSetup()
        
        guard let presenter = presenter else {
            return
        }
        
        if let imageName = presenter.imageName {
            categoryImage.image = UIImage(named: imageName)
        }
        
        label.text = presenter.title
        backgroundColor = AppColor.colorMainBg
        roundedView.backgroundColor = AppColor.colorSupportBg
        label.textColor = AppColor.colorTitle
    }
}

extension CategoryTableViewCell: HighlightingView {
}

extension CategoryTableViewCell: HighlightableCell {
    func didHighlighted() {
        highlight(view: roundedView)
    }
    
    func didUnhighlighted() {
        unhighlight(view: roundedView)
    }
}

