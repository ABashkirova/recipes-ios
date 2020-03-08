//
//  ListNavigationController.swift
//  Recipes
//
//  Created by Александра Башкирова on 03/02/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class ListNavigationController: UINavigationController {
    init(rootViewController: UIViewController, config: ListNavigationControllerConfig) {
        super.init(rootViewController: rootViewController)
        navigationBar.backgroundColor = config.backgroundColor
        
        let titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: config.titleColor,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: config.titleSize)
        ]
        
        navigationBar.titleTextAttributes = titleTextAttributes
        navigationBar.backItem?.backBarButtonItem?.setTitleTextAttributes(
            titleTextAttributes,
            for: UIControl.State.normal
        )
        navigationBar.tintColor = config.titleColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}

struct ListNavigationControllerConfig {
    let backgroundColor: UIColor
    let titleColor: UIColor
    let titleSize: CGFloat
    
    static let `default` = ListNavigationControllerConfig(
        backgroundColor: AppColor.colorMainBg,
        titleColor: AppColor.colorTitle,
        titleSize: 22
    )
}
