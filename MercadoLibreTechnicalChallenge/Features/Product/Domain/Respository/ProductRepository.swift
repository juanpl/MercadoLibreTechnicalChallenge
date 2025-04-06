//
//  ProductRepository.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 6/04/25.
//

import Foundation

enum RepositoryError: Error {
    case getProductListFailed
    case getProductInfoFailed
}

protocol ProductRepository {
    func getProductList(query: String, offset: Int, limit: Int) async -> Result<[ProductListItem], RepositoryError>
    func getProductInfo(id: String) async -> Result<Product, RepositoryError>
}
