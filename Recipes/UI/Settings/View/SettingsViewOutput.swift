//
//  SettingsViewOutput.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 20/10/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

protocol SettingsViewOutput: class {
    var cellPresenters: [[CellPresenter]] { get }
    /**
        @author Alexandra Bashkirova
        Notify presenter that view is ready
    */

    func viewIsReady()
}
