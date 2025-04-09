//
//  ProductViewModel.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 8/04/25.
//

import Foundation

class ProductListViewModel {
    
    var searchInputText: String = ""
    var products: [ProductListItem] = []
    var pagingCounter: Int = 0
    var errorMessage = ""
    var ShowErrorMessage: Bool = false
    
    private let getProductListUseCase: GetProductListUseCase
    
    init(getProductListUseCase: GetProductListImp = GetProductListImp()) {
        self.getProductListUseCase = getProductListUseCase
    }
    
    func loadProductList(query: String, offset: Int, limit: Int) async {
        let result = await getProductListUseCase.getProductList(query: searchInputText, offset: pagingCounter*5, limit: (pagingCounter*5)+5)
        
        switch result {
        case .success(let list):
            
            //Va concatenando las respuestas a medida que se ejecuta la función
            self.products += list
            self.pagingCounter += 1
            
            
        case .failure(let error):
            print("Error al obtener productos: \(error)")
            errorMessage = "Error cargando los productos"
            ShowErrorMessage = true
        }
        
    }
    
    
}
