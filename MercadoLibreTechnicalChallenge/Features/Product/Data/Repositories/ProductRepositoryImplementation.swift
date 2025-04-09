//
//  ProductRepositoryImplementation.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 8/04/25.
//

import Foundation

class ProductRepositoryImplementation: ProductRepository {
    
    var mercadoLibreRemoteDataSource: MercadoLibreRemoteDataSource
    
    init(mercadoLibreRemoteDataSource: MercadoLibreRemoteDataSource) {
        self.mercadoLibreRemoteDataSource = mercadoLibreRemoteDataSource
    }
    
    
    func getProductList(query: String, offset: Int, limit: Int) async -> Result<[ProductListItem], RepositoryError> {
        let result = await mercadoLibreRemoteDataSource.fetchProductListFromAPI(query: query, offset: offset, limit: limit)

        switch result {
        case .success(let products):
            return .success(products)
        case .failure(let error):
            print("Error en getProductList: \(error)")
            return .failure(.getProductListFailed)
        }
    }
    
    func getProductInfo(id: String) async -> Result<Product, RepositoryError> {
        let result = await mercadoLibreRemoteDataSource.fetchProductInfoFromAPI(id: id)

        switch result {
        case .success(let product):
            return .success(product)
        case .failure(let error):
            print("Error en getProductInfo: \(error)")
            return .failure(.getProductInfoFailed)
        }
    }
    
    

}
