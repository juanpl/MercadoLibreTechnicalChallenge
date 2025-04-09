//
//  ProductViewModel.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 8/04/25.
//

import Foundation

class ProductViewModel {
    
    var products: [ProductListItem] = []
    var pagingCounter: Int = 0
    
    private let ProductRepository: ProductRepository
    
    init(ProductRepository: ProductRepository = ProductRepositoryImplementation()) {
        self.ProductRepository = ProductRepository
    }
    
    func loadProductList(query: String, offset: Int, limit: Int) async {
        
    }
    
    
}
