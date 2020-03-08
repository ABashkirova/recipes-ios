//
//  UIImageView+setImage.swift
//  Recipes
//
//  Created by Александра Башкирова on 28/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with url: String, placeholder: String?) {
        guard let imageUrl = URL(string: url) else { return }
        
        if let placeholderName = placeholder {
            let placeholderImage = UIImage(named: placeholderName)
            kf.setImage(with: imageUrl, placeholder: placeholderImage)
        } else {
            kf.setImage(with: imageUrl)
        }
    }
}
