//
//  SettingsConfigurator.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 20/10/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

import UIKit

class SettingsConfigurator {
    private let settingsCellPresentersFactory: SettingsCellPresentersFactory
    init(settingsCellPresentersFactory: SettingsCellPresentersFactory) {
        self.settingsCellPresentersFactory = settingsCellPresentersFactory
    }
    
    func configure() -> UIViewController {
        let router = SettingsRouter()

        let interactor = SettingsInteractor()

        let presenter = SettingsPresenter(
            settingsCellPresentersFactory: settingsCellPresentersFactory,
            interactor: interactor,
            router: router
        )
        
        
        let viewController = SettingsViewController(presenter: presenter)
        
        let navigationController = ListNavigationController(rootViewController: viewController, config: .default)
               
        router.setViewController(viewController)
        
        return navigationController
    }

}
