//
//  RecipeViewController.swift
//  Recipes
//
//  Created by Александра Башкирова on 04/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

enum TableSection: Int {
    case recipeImage = 0, description, segmentcontrol, ingredients, steps
}

class RecipeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var roundedView: RoundedView!
    
    private var presenter: RecipeViewOutput!
    private var cellPresenters: [[CellPresenter]] = []
    private let delegate = TableViewDelegate()
    
    func updatePresenters(_ cellPresenters: [[CellPresenter]]) {
        self.cellPresenters = cellPresenters
    }
    
    convenience init(presenter: RecipeViewOutput) {
        self.init()
        
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
        
        tableView.dataSource = self
        tableView.delegate = delegate
        
        tableView.register(cellType: RecipeImageTableViewCell.self)
        tableView.register(cellType: RecipeSegmentControlTableViewCell.self)
        tableView.register(cellType: DescriptionTableViewCell.self)
        tableView.register(cellType: StepTableViewCell.self)
        tableView.register(cellType: IngredientTableViewCell.self)
        
        presenter.cellUpdatedSignal.observeValues { [weak self] in
            UIView.performWithoutAnimation {
                self?.tableView.beginUpdates()
                self?.tableView.endUpdates()
            }
        }
        
        updatePresenters(presenter.recipeCellPresenters.value)
        tableView.reloadData()
        
        presenter.updateSegmentDependentCellSignal.observeValues { [weak self] cellIndex in
            self?.updateSegmentDependentCell(section: cellIndex)
        }
        
        view.backgroundColor = AppColor.colorMainBg
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.contentInset = view.safeAreaInsets
    }
    
    @IBAction func onTapCloseButton(_ sender: Any) {
        presenter.close()
    }
    
    private func updateSegmentDependentCell(section: Int) {
        updatePresenters(presenter.recipeCellPresenters.value)
        UIView.performWithoutAnimation {
            tableView.beginUpdates()
            tableView.reloadSections(IndexSet(integer: section), with: .none)
            tableView.endUpdates()
        }
    }
}

extension RecipeViewController: UITableViewDataSource {
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

private class TableViewDelegate: NSObject {
}

extension TableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
