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
    private var products: [ProductListItem]
    
    private var pagingCounter: Int = 0
    private var errorMessage:String = ""
    private var ShowErrorMessage: Bool = false
    private var searchInputText: String = ""
    
    
    
    init(products: [ProductListItem] = [], getProductListUseCase: GetProductListImp = GetProductListImp()) {
        self.products = products
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
            print("Error al obtener lista productos: \(error)")
            errorMessage = "Error cargando los productos"
            ShowErrorMessage = true
        }
        
    }
    
    
}
