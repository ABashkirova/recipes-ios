//
//  TableView+dequeueReusableCell.swift
//  ramba-tests
//
//  Created by Chernousov Alexander on 03/01/2019.
//  Copyright © 2019 Chernousov Alexander. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell(for indexPath: IndexPath, with cellPresenter: CellPresenter) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cellPresenter.reusableClass.reuseIdentifier, for: indexPath) as? TableViewCellWithPresenter else {
            fatalError()
        }
        
        cell.setup(cellPresenter)
        return cell
    }
}
