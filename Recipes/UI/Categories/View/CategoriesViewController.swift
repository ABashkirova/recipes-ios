//
//  CategoriesViewController.swift
//  Recipes
//
//  Created by Александра Башкирова on 20/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: CategoriesViewOutput!
    private let dataSource = TableViewDataSource()
    
    convenience init(presenter: CategoriesViewOutput) {
        self.init()
        
        tabBarItem = TabBarItem(config: TabBarItemConfig(
            title: localize(key: "Categories"),
            defaultImage: UIImage(named: "Recipes")!,
            selectedImage: UIImage(named: "RecipesSelected")!
        ))
        
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = localize(key: "Categories")
        view.backgroundColor = AppColor.colorMainBg
        
        tableView.delegate = self
        tableView.dataSource = dataSource
        
        tableView.register(cellType: CategoryTableViewCell.self)
        
        presenter?.categoryCellPresenters.producer.startWithValues { [weak self] cellPresenters in
            self?.dataSource.updatePresenters(cellPresenters)
            self?.tableView.reloadData()
        }
    }
}

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? HighlightableCell {
            cell.didHighlighted()
        }
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? HighlightableCell {
            cell.didUnhighlighted()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath.row)
    }
}

