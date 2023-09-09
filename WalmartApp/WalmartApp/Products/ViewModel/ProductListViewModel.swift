//
//  ProductListViewModel.swift
//  WalmartApp
//
//  Created by Luis R on 08/09/23.
//

import Foundation
import UIKit
import CoreData

protocol ProductListViewModelProtocol {
    func fetchProducts() async throws -> [ProductElement]
}

protocol ProductListViewProtocol {
    func finishLoadProducts()
}


class ProductListViewModel: ProductListViewModelProtocol {
    var view: ProductListViewProtocol?
    var products: [ProductElement]?
    
    func fetchProducts() async throws -> [ProductElement] {
        let endpoint = "https://fakestoreapi.com/products?sort=desc"
        
        guard let url = URL(string: endpoint) else {
            throw ProductError.invalidError
        }
        let (data, response ) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ProductError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([ProductElement].self, from: data)
        } catch {
            throw ProductError.invalidData
        }
        
    }
    
    func initViewModel() async {
            Task {
                self.products = try await self.fetchProducts()
                self.view?.finishLoadProducts()
               // self.saveData()
            }
    }
    
    func saveData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        guard let productsToSave = products as? [ProductElement] else {
            return
        }
        for productData in productsToSave {
            let productEntity = NSEntityDescription.insertNewObject(forEntityName: "ProductsEntity", into: context) as! ProductEntity
            productEntity.product_title = productData.title
            productEntity.product_price = productData.price
            
            appDelegate.saveContext()
        }
    }
}




enum ProductError: Error {
    case invalidResponse
    case invalidError
    case invalidData

}
