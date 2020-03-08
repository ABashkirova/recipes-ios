//
//  SubcategoryCollectionViewCell.swift
//  Recipes
//
//  Created by Александра Башкирова on 27/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class SubcategoryCollectionViewCell: CollectionViewCell<SubcategoryCollectionViewCellPresenter> {
    
    @IBOutlet weak var roundedView: RoundedView!
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var label: UILabel!
    
    var selectedColor: UIColor = .white
    var baseColor: UIColor = AppColor.colorMainTheme
    var shadowColor: UIColor = AppColor.colorSupportBg
    
    var state: SubcategoryLabelState = .base {
        didSet {
            switch state {
            case .base:
                roundedView.backgroundColor = baseColor
                shadowView.shadowOpacity = 0.0
                label.textColor = selectedColor
                label.font = UIFont.systemFont(ofSize: 16, weight: .light)
            case .selected:
                roundedView.backgroundColor = selectedColor
                shadowView.shadowOpacity = 0.4
                shadowView.shadowColor = shadowColor
                label.textColor = baseColor
                label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            }
        }
    }
    
    override func didSetup() {
        super.didSetup()
        
        guard let presenter = presenter else {
            return
        }
        
        label.text = presenter.name
        
        presenter.state.producer.take(until: reuseSignal)
            .startWithValues { [weak self] stateType in
                self?.state = stateType
            }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
