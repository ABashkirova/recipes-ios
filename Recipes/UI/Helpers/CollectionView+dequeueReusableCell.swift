//
//  CollectionView+dequeueReusableCell.swift
//  Recipes
//
//  Created by Александра Башкирова on 27/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell(for indexPath: IndexPath, with cellPresenter: CellPresenter) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellPresenter.reusableClass.reuseIdentifier, for: indexPath) as? CollectionViewCellWithPresenter else {
            fatalError()
        }
        
        cell.setup(cellPresenter)
        return cell
    }
}
