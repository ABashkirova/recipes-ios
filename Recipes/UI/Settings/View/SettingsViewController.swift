//
//  SettingsViewController.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 20/10/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

import UIKit

enum SettingsTableSection: Int {
    case aboutAuthor = 0, socialLinks, aboutApp
}

class SettingsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: SettingsViewOutput!
    private var cellPresenters: [[CellPresenter]] = []
    private let delegate = TableViewDelegate()
    
    convenience init(presenter: SettingsViewOutput) {
        self.init()
        
        title = localize(key: "AboutApp")
        tabBarItem = TabBarItem(config: TabBarItemConfig(
            title: localize(key: "About"),
            defaultImage: UIImage(named: "moreBar")!,
            selectedImage: UIImage(named: "moreBarSelected")!
        ))
        
        self.presenter = presenter
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
        
        view.backgroundColor = AppColor.colorMainBg
        
        tableView.dataSource = self
        tableView.delegate = delegate
        
        //register cells
        tableView.register(cellType: LinkTableViewCell.self)
        tableView.register(cellType: AboutTableViewCell.self)
        
        cellPresenters = presenter.cellPresenters
    }
    
    func updatePresenters(_ cellPresenters: [[CellPresenter]]) {
        self.cellPresenters = cellPresenters
    }
}

private class TableViewDelegate: NSObject {
}


extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellPresenters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellPresenters[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         return tableView.dequeueReusableCell(for: indexPath, with: cellPresenters[indexPath.section][indexPath.row])
    }
}

extension TableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
