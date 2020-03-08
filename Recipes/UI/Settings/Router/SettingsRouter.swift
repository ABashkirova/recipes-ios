//
//  SettingsRouter.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 20/10/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

import UIKit

class SettingsRouter {
    private weak var viewController: UIViewController?

    func setViewController(_ vc: UIViewController) {
        viewController = vc
    }
}

extension SettingsRouter: SettingsRouterInput {
    func open(appUrl: URL?, siteUrl: URL?) {
        if let appUrl = appUrl, UIApplication.shared.canOpenURL(appUrl) {
            UIApplication.shared.open(appUrl, options: [:], completionHandler: nil)
        } else if let siteUrl = siteUrl, UIApplication.shared.canOpenURL(siteUrl) {
            UIApplication.shared.open(siteUrl, options: [:], completionHandler: nil)
        }
    }
}
