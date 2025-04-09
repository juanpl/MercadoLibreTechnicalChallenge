//
//  GetProductInfoImp.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 9/04/25.
//

import Foundation

class GetProductInfoImp: GetProductInfoUseCase {
    
    var mercadoLibreRemoteDataSource: MercadoLibreRemoteDataSource
    
    init(mercadoLibreRemoteDataSource: MercadoLibreRemoteDataSource) {
        self.mercadoLibreRemoteDataSource = mercadoLibreRemoteDataSource
    }
    
    func getProductInfo(id: String) async -> Result<Product, GetProductInfoError> {
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
