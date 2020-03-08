//
//  SubcategoriesTableViewCell.swift
//  Recipes
//
//  Created by Александра Башкирова on 26/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class SubcategoriesTableViewCell: TableViewCell<SubcategoriesTableCellPresenter> {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let collectionViewDataSource = CollectionViewDataSource()
    
    override func didSetup() {
        super.didSetup()
        
        guard let presenter = presenter else {
            return
        }
        
        collectionView.delegate = self
        
        collectionView.contentInset.left = 12
        collectionView.contentInset.right = 12
        
        presenter.subcategoryCellPresenters.producer.take(until: reuseSignal).startWithValues { [weak self] cellPresenters in
           self?.updateCollectionView(with: cellPresenters)
        }
    }
    
    private func updateCollectionView(with cellPresenters: [CellPresenter]) {
        collectionViewDataSource.updatePresenters(cellPresenters)
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = collectionViewDataSource
        collectionView.register(cellType: SubcategoryCollectionViewCell.self)
    }
}

extension SubcategoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = presenter?.subcategories[indexPath.item].name
        label.sizeToFit()
        let referenceHeight: CGFloat = 32
        let referenceWidth = label.frame.width + 16
        return CGSize(width: referenceWidth, height: referenceHeight)
    }
}

extension SubcategoriesTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath.row)
    }
}
