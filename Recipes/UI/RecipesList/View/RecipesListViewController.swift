//
//  RecipesListRecipesListViewController.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 04/01/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//

import UIKit

class RecipesListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: RecipesListViewOutput!
    private let dataSource = TableViewDataSource()
    let searchController = UISearchController(searchResultsController: nil)
    
    convenience init(presenter: RecipesListViewOutput) {
        self.init()
        
        tabBarItem = TabBarItem(config: TabBarItemConfig(
            title: localize(key: "Favorites"),
            defaultImage: UIImage(named: "LikeBar")!,
            selectedImage: UIImage(named: "LikeBarSelected")!
        ))

        self.presenter = presenter
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = localize(key: "Search Recipes")
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = presenter?.title
        view.backgroundColor = AppColor.colorMainBg
        
        tableView.delegate = self
        tableView.dataSource = dataSource
        
        tableView.register(cellType: SubcategoriesTableViewCell.self)
        tableView.register(cellType: RecipeTableViewCell.self)
        
        presenter?.recipeListCellPresenters.producer.startWithValues { [weak self] cellPresenters in
            self?.dataSource.updatePresenters(cellPresenters as! [CellPresenter])
            self?.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
}

extension RecipesListViewController: UITableViewDelegate {
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

extension RecipesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        presenter?.didChangeSearch(text: searchController.searchBar.text)
    }
}
