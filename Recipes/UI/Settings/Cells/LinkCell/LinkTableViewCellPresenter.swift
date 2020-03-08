//
//  LinkTableViewCellPresenter.swift
//  Recipes
//
//  Created by Александра Башкирова on 20.10.2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit
import Reusable
import ReactiveSwift

class LinkTableViewCellPresenter: CellPresenter {
    let reusableClass: Reusable.Type = LinkTableViewCell.self
    
    let icon: String?
    let title: String
    let subtitle: String
    let type: LinkType
    private let cellSeletedAction: ((LinkType) -> Void)
    
    init(
        config: LinkConfig,
        cellSeletedAction: @escaping ((LinkType) -> Void)
    ) {
        self.icon = config.imagePreview
        self.title = config.titleLink
        self.subtitle = config.subtitleLink
        self.type = config.type
        self.cellSeletedAction = cellSeletedAction
    }
    
    func didSelectedCell() {
        cellSeletedAction(type)
    }
}
