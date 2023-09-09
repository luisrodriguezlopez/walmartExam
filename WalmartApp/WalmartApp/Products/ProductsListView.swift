//
//  ProductsListView.swift
//  WalmartApp
//
//  Created by Luis R on 08/09/23.
//

import Foundation
import UIKit

// Exercise 2: Table View Integration
class ProductListView : UIViewController {
 
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        return tableView
    }()
    
    
    var viewModel : ProductListViewModel?
    
    override func viewDidLoad() {
        self.setupUI()
        self.viewModel = ProductListViewModel()
        self.viewModel?.view = self
        async {
            await self.viewModel?.initViewModel()
        }
    }
    

    
    func setupUI() {
        self.tableView.register(ProductCellView.self, forCellReuseIdentifier: ProductCellView.identifier)
        self.view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true

    }
    
    
}
extension ProductListView : ProductListViewProtocol {
    func finishLoadProducts() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ProductListView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCellView.identifier, for: indexPath) as? ProductCellView else {
            return UITableViewCell()
        }
        guard let currentRow =  self.viewModel?.products?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.setupData(product: currentRow)
        return cell
    }
    
    
}
