//
//  ProductInfoViewModel.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 9/04/25.
//

import Foundation

class ProductInfoViewModel {
    
    private let getProductInfo: GetProductInfoUseCase
    
    var product: Product?
    var showErrorMessage: Bool = false
    var errorMessage: String = ""
    
    
    init(getProductInfo: GetProductInfoUseCase = GetProductInfoImp(),
         product: Product? = nil) {
        self.getProductInfo = getProductInfo
        self.product = product
    }
    
    func loadProductInfo(id: String) async {
        let result = await getProductInfo.getProductInfo(id: id)
        
        switch result {
        case .success(let product):
            self.product = product
        case .failure(let error):
            print("Error al obtener productos: \(error)")
        }
    }
    
}
