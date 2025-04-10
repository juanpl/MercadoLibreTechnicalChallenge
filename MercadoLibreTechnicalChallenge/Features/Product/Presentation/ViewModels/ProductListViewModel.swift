//
//  ProductViewModel.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 8/04/25.
//

import Foundation
import Observation

@Observable
class ProductListViewModel {
    
    
    
    private let getProductListUseCase: GetProductListUseCase
    var products: [ProductListItem]
    
    var pagingCounter: Int = 0
    var errorMessage:String = ""
    var ShowErrorMessage: Bool = false
    var searchInputText: String = ""
    var countryIndicator: String = "MCO"
    
    
    
    init(products: [ProductListItem] = [], getProductListUseCase: GetProductListUseCase = GetProductListImp()) {
        self.products = products
        self.getProductListUseCase = getProductListUseCase
    }
    
    func loadProductList(query: String, offset: Int, limit: Int) async {
        let result = await getProductListUseCase.getProductList(query: query, offset: pagingCounter*5, limit: (pagingCounter*5)+5)
        
        switch result {
        case .success(let list):
            
            //Va concatenando las respuestas a medida que se ejecuta la función
            self.products += list
            self.pagingCounter += 1
            
            
        case .failure(let error):
            print("Error al obtener lista productos: \(error)")
            errorMessage = "Error cargando los productos"
            ShowErrorMessage = true
        }
        
    }
    
    
}
