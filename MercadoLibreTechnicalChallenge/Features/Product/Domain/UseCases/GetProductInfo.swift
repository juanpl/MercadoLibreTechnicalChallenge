//
//  GetProductInfo.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 6/04/25.
//

import Foundation

enum GetProductInfoError: Error {
    case getProductInfoFailed
}

protocol GetProductInfoUseCase {
    func getProductInfo(id: String) async -> Result<Product, GetProductInfoError>
}
