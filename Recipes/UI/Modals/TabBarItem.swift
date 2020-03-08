//
//  TabBarItem.swift
//  Recipes
//
//  Created by Александра Башкирова on 20.10.2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class TabBarItem: UITabBarItem {
    convenience init(config: TabBarItemConfig) {
        self.init(
            title: config.title,
            image: config.defaultImage,
            selectedImage: config.selectedImage?.withRenderingMode(config.renderingMode)
        )
        
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor: config.textColor], for: .normal)
    }
}

struct TabBarItemConfig {
    let title: String
    let defaultImage: UIImage?
    let selectedImage: UIImage?
    let textColor: UIColor
    let renderingMode: UIImage.RenderingMode
    
    init(
        title: String,
        defaultImage: UIImage?,
        selectedImage: UIImage?,
        textColor: UIColor = AppColor.colorTitle,
        renderingMode: UIImage.RenderingMode = .alwaysOriginal
    ) {
        self.title = title
        self.defaultImage = defaultImage
        self.selectedImage = selectedImage
        self.textColor = textColor
        self.renderingMode = renderingMode
    }
}
