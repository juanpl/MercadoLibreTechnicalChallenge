//
//  GetProductList.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 6/04/25.
//

import Foundation

struct GetProductListUseCase {
    
    private let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute(query: String, offset: Int, limit: Int) async -> Result<[ProductListItem], RepositoryError> {
        return await repository.getProductList(query: query, offset: offset, limit: limit)
    }

    
}
