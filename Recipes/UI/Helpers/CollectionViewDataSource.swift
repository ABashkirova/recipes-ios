//
//  CollectionViewDataSource.swift
//  Recipes
//
//  Created by Александра Башкирова on 27/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

import UIKit

class CollectionViewDataSource: NSObject {
    private var cellPresenters: [CellPresenter] = []
    
    func updatePresenters(_ cellPresenters: [CellPresenter]) {
        self.cellPresenters = cellPresenters
    }
}

extension CollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellPresenters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(for: indexPath, with: cellPresenters[indexPath.row])
    }
}


