//
//  GetProductInfo.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 6/04/25.
//

import Foundation

struct GetProductInfoUseCase {
    
    private let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute(id: String) async -> Result<Product, RepositoryError>  {
        return await repository.getProductInfo(id: id)
    }
    
}
