//
//  SettingsCellPresentersFactory.swift
//  Recipes
//
//  Created by Александра Башкирова on 20.10.2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

class SettingsCellPresentersFactory {
    func createLinkTableViewCellPresenterFactory(
        config: LinkConfig,
        cellSeletedAction: @escaping ((LinkType) -> Void)
    ) -> LinkTableViewCellPresenter {
        return LinkTableViewCellPresenter(config: config, cellSeletedAction: cellSeletedAction)
    }
    
    func createAboutTableViewCellPresenterFactory() -> AboutViewCellPresenter {
        return AboutViewCellPresenter()
    }
}
