//
//  ProductListMock.swift
//  MercadoLibreTechnicalChallengeTests
//
//  Created by Juan Pablo Lasprilla Correa on 13/04/25.
//

import Foundation
@testable import MercadoLibreTechnicalChallenge

var mockListProduct: [ProductListItem] = []

struct mockGetProductList: GetProductListUseCase {

    func getProductList(query: String, site: String, offset: Int, limit: Int) async -> Result<[MercadoLibreTechnicalChallenge.ProductListItem], MercadoLibreTechnicalChallenge.GetProductListError> {
        
        var listProduct: [ProductListItem] = []
        let productItemList: ProductListItem = ProductListItem(
            id: "MCO30400479",
            name: "iPhone 3G",
            image: "https://http2.mlstatic.com/D_NQ_NP_796973-MLA28284457453_102018-F.jpg"
        )
        
        if(query == "iPhone 3G"){
            for _ in 1...limit {
                listProduct.append(productItemList)
            }
            
            return .success(listProduct)
        }
        
        else {
            return .failure(.getProductListFailed)
        }

    }
}
