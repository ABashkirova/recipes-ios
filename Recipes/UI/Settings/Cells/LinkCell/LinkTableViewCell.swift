//
//  LinkTableViewCell.swift
//  Recipes
//
//  Created by Александра Башкирова on 20.10.2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class LinkTableViewCell: TableViewCell<LinkTableViewCellPresenter> {

    @IBOutlet weak var iconLink: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func didSetup() {
        super.didSetup()
        
        guard let presenter = presenter else { return }
        titleLabel.textColor = AppColor.colorTitle
        subtitleLabel.textColor = AppColor.colorText
        
        titleLabel.text = presenter.title
        subtitleLabel.text = presenter.subtitle
        
        guard let imageName = presenter.icon else { return }
        
        iconLink.image = UIImage(named: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        guard selected else { return }
        
        presenter?.didSelectedCell()
        
    }
    
}
