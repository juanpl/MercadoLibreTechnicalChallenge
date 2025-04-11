//
//  ProductInfoViewModel.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 9/04/25.
//

import Foundation
import Observation

@Observable
class ProductInfoViewModel {
    
    private let getProductInfoUseCase: GetProductInfoUseCase
    
    var product: Product?
    var showErrorMessage: Bool = false
    var errorMessage: String = ""
    
    
    init(getProductInfoUseCase: GetProductInfoUseCase = GetProductInfoImp(),
         product: Product? = nil) {
        self.getProductInfoUseCase = getProductInfoUseCase
        self.product = product
    }
    
    func loadProductInfo(id: String) async {
        let result = await getProductInfoUseCase.getProductInfo(id: id)
        
        switch result {
        case .success(let product):
            self.product = product
        case .failure(let error):
            print("Error al obtener productos: \(error)")
            showErrorMessage = true
            errorMessage = "Error cargando el producto"
        }
    }
    
}
