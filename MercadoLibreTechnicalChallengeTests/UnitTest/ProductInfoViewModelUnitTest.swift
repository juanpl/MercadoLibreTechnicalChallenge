//
//  ProductInfoViewModelMockTest.swift
//  MercadoLibreTechnicalChallengeTests
//
//  Created by Juan Pablo Lasprilla Correa on 9/04/25.
//

import XCTest
@testable import MercadoLibreTechnicalChallenge


final class ProductInfoViewModelUnitTest: XCTestCase {
    
    var viewModel: ProductInfoViewModel!
    
    override func setUpWithError() throws {
        viewModel = ProductInfoViewModel(getProductInfoUseCase: mockGetProductInfoUseCase())
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testErrorIdProduct() async {
        // Given
        let id = "MCO30400000"
        
        //When
        await viewModel.loadProductInfo(id: id)
        
        // Then
        XCTAssertNil(viewModel.product)
        XCTAssertEqual(viewModel.errorMessage, "Error cargando el producto")
        XCTAssertEqual(viewModel.showErrorMessage, true)
    }
    
    func testSuccesIdProduct() async {
        let id = "MCO30400479"
        
        //When
        await viewModel.loadProductInfo(id: id)
        
        // Then
        XCTAssertNotNil(viewModel.product)
        XCTAssertEqual(viewModel.errorMessage, "")
        XCTAssertEqual(viewModel.showErrorMessage, false)
    }
    
    
}

