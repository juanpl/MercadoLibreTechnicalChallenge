//
//  ProductListViewModelMockTest.swift
//  MercadoLibreTechnicalChallengeTests
//
//  Created by Juan Pablo Lasprilla Correa on 9/04/25.
//

import XCTest
@testable import MercadoLibreTechnicalChallenge


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
        let countrySite = "MCO"

        //When
        await viewModel.loadProductList(query: query, countrySite: countrySite)
        
        //Then
        XCTAssertEqual(viewModel.products.count, 0)
        XCTAssertEqual(viewModel.pagingCounter, 0)
        XCTAssertEqual(viewModel.errorMessage, "Error cargando los productos")
        XCTAssertEqual(viewModel.ShowErrorMessage, true)
    }
    
    func testOneSuccesSearch() async {
        //Give
        let query: String = "iPhone 3G"
        let countrySite = "MCO"
        //When
        await viewModel.loadProductList(query: query, countrySite: countrySite)
        
        //Then
        XCTAssertEqual(viewModel.products.count, 5)
        XCTAssertEqual(viewModel.pagingCounter, 1)
        XCTAssertEqual(viewModel.errorMessage, "")
        XCTAssertEqual(viewModel.ShowErrorMessage, false)
    }
    
    func testTwoSuccesSearch() async {
        //Give
        let query: String = "iPhone 3G"
        let countrySite = "MCO"
        
        //When
        await viewModel.loadProductList(query: query, countrySite: countrySite)
        await viewModel.loadProductList(query: query, countrySite: countrySite)
        
        //Then
        XCTAssertEqual(viewModel.products.count, 10)
        XCTAssertEqual(viewModel.pagingCounter, 2)
        XCTAssertEqual(viewModel.errorMessage, "")
        XCTAssertEqual(viewModel.ShowErrorMessage, false)
    }
    
}

