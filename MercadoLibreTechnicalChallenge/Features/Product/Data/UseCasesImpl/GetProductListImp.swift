//
//  GetProductInfoImp.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 9/04/25.
//

import Foundation

class GetProductListImp: GetProductListUseCase {
    
    var mercadoLibreRemoteDataSource: MercadoLibreRemoteDataSource
    
    init(mercadoLibreRemoteDataSource: MercadoLibreRemoteDataSource = MercadoLibreRemoteDataSource()) {
        self.mercadoLibreRemoteDataSource = mercadoLibreRemoteDataSource
    }
    
    
    func getProductList(query: String, offset: Int, limit: Int) async -> Result<[ProductListItem], GetProductListError> {
        let result = await mercadoLibreRemoteDataSource.fetchProductListFromAPI(query: query, offset: offset, limit: limit)

        switch result {
        case .success(let products):
            return .success(products)
        case .failure(let error):
            print("Error en getProductList: \(error)")
            return .failure(.getProductListFailed)
        }
    }
}
