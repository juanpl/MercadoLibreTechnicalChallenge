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
    var moreProductsAreLoading: Bool = false
    var countrySite: String = "MCO"
    
    
    
    init(products: [ProductListItem] = [], getProductListUseCase: GetProductListUseCase = GetProductListImp()) {
        self.products = products
        self.getProductListUseCase = getProductListUseCase
    }
    
    func loadProductList(query: String) async {
        
        guard !moreProductsAreLoading else { return } // ← no hagas nada si ya está cargando
        moreProductsAreLoading = true

        defer { moreProductsAreLoading = false }
        
        let result = await getProductListUseCase.getProductList(query: query, site: countrySite , offset: (pagingCounter*10), limit: 10)
        
        switch result {
        case .success(let list):
            await MainActor.run {
                if list.isEmpty && pagingCounter == 0  {
                    errorMessage = "No hay ningun producto con ese nombre."
                    ShowErrorMessage = true
                    return
                }
                
                if !list.isEmpty {
                    //Va concatenando las respuestas a medida que se ejecuta la función
                    self.products += list
                    self.pagingCounter += 1
                    return
                }
            }
            
            
        case .failure(let error):
            print("Error al obtener lista productos: \(error)")
            errorMessage = "Error cargando los productos"
            ShowErrorMessage = true
        }
        
    }
    
    
}
