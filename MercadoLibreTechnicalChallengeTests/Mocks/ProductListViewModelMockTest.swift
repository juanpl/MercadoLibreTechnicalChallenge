//
//  ProductListViewModelMockTest.swift
//  MercadoLibreTechnicalChallengeTests
//
//  Created by Juan Pablo Lasprilla Correa on 9/04/25.
//

import XCTest
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

final class ProductListViewModelMockTest: XCTestCase {
    
    var viewModel: ProductListViewModel!
    
    override func setUpWithError() throws {
        viewModel = ProductListViewModel(getProductListUseCase: mockGetProductList())
    }
    
    override func tearDownWithError() throws {
        viewModel.products = []
    }
    
    func testErrorQuery() async {
        //Give
        let query = "iPhone 4"

        //When
        await viewModel.loadProductList(query: query)
        
        //Then
        XCTAssertEqual(viewModel.products.count, 0)
        XCTAssertEqual(viewModel.pagingCounter, 0)
        XCTAssertEqual(viewModel.errorMessage, "Error cargando los productos")
        XCTAssertEqual(viewModel.ShowErrorMessage, true)
    }
    
    func testOneSuccesSearch() async {
        //Give
        let query: String = "iPhone 3G"
        
        //When
        await viewModel.loadProductList(query: query)
        
        //Then
        XCTAssertEqual(viewModel.products.count, 5)
        XCTAssertEqual(viewModel.pagingCounter, 1)
        XCTAssertEqual(viewModel.errorMessage, "")
        XCTAssertEqual(viewModel.ShowErrorMessage, false)
    }
    
    func testTwoSuccesSearch() async {
        //Give
        let query: String = "iPhone 3G"
        
        //When
        await viewModel.loadProductList(query: query)
        await viewModel.loadProductList(query: query)
        
        //Then
        XCTAssertEqual(viewModel.products.count, 15)
        XCTAssertEqual(viewModel.pagingCounter, 2)
        XCTAssertEqual(viewModel.errorMessage, "")
        XCTAssertEqual(viewModel.ShowErrorMessage, false)
    }
    
}

