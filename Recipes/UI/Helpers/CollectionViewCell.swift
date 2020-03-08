//
//  CollectionViewCell.swift
//  Recipes
//
//  Created by Александра Башкирова on 27/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit
import Reusable
import ReactiveSwift

class CollectionViewCellWithPresenter: UICollectionViewCell, NibReusable {
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

class CollectionViewCell<T: CellPresenter>: CollectionViewCellWithPresenter {
    var presenter: T? {
        return internalPresenter as? T
    }
}
