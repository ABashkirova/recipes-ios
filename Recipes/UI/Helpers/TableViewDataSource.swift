//
//  TableViewDataSource.swift
//  Recipes
//
//  Created by Александра Башкирова on 07/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject {
    private var cellPresenters: [CellPresenter] = []
    
    func updatePresenters(_ cellPresenters: [CellPresenter]) {
        self.cellPresenters = cellPresenters
    }
}

extension TableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellPresenters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(for: indexPath, with: cellPresenters[indexPath.row])
    }
}


