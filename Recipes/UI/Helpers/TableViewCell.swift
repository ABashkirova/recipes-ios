//
//  TableViewCell.swift
//  ramba-tests
//
//  Created by Chernousov Alexander on 03/01/2019.
//  Copyright © 2019 Chernousov Alexander. All rights reserved.
//

import UIKit
import Reusable
import ReactiveSwift

class TableViewCellWithPresenter: UITableViewCell, NibReusable {
    fileprivate var internalPresenter: CellPresenter?
    
    var reuseSignal: Signal<(), Never>!
    private var reuseObserver: Signal<(), Never>.Observer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let (signal, observer) = Signal<(), Never>.pipe()
        (reuseSignal, reuseObserver) = (signal, observer)
    }
    
    final func setup(_ cellPresenter: CellPresenter) {
        internalPresenter = cellPresenter
        reuseObserver.send(value: ())
        didSetup()
    }
    
    func didSetup() {
        
    }
}

class TableViewCell<T: CellPresenter>: TableViewCellWithPresenter {
    var presenter: T? {
        return internalPresenter as? T
    }
}
