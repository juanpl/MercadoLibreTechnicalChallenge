//
//  GetProductList.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 6/04/25.
//

import Foundation

enum GetProductListError: Error {
    case getProductListFailed
}

protocol GetProductListUseCase {
    func getProductList(query: String, offset: Int, limit: Int) async -> Result<[ProductListItem], GetProductListError>
}
