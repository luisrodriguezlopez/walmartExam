//
//  ProductListViewModel.swift
//  WalmartApp
//
//  Created by Luis R on 08/09/23.
//

import Foundation

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
       // guard let reponse = response
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
            }
    }
}




enum ProductError: Error {
    case invalidResponse
    case invalidError
    case invalidData

}
