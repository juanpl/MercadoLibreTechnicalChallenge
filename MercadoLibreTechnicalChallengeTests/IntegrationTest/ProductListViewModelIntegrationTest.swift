//
//  ProductListViewModelIntegrationTest.swift
//  MercadoLibreTechnicalChallengeTests
//
//  Created by Juan Pablo Lasprilla Correa on 10/04/25.
//

import XCTest
@testable import MercadoLibreTechnicalChallenge

final class ProductListViewModelIntegrationTest: XCTestCase {
    
    var sut: ProductListViewModel!
    
    override func setUpWithError() throws {
        sut = ProductListViewModel() //sut: system under test
    }
    
    override func tearDownWithError() throws {
        sut.products=[]
    }
    
    func testGetListSucces() async throws {
        //Give
        let query = "iphone"
        let countrySite = "MCO"
        
        //When
        await sut.loadProductList(query: query, countrySite: countrySite)
        let listReference: [ProductListItem] = [
            ProductListItem(id: "MCO30400479", name: " iPhone 3G", image: "https://http2.mlstatic.com/D_NQ_NP_796973-MLA28284457453_102018-F.jpg"),
            ProductListItem(id: "MCO6345170", name: "Apple Iphone se iPhone SE - Plata - 32 GB - 2 GB", image: "https://http2.mlstatic.com/D_NQ_NP_726769-MLU75333762318_032024-F.jpg"),
            ProductListItem(id: "MCO6037349", name: "iPhone 4s 8 GB negro", image: "https://mla-s2-p.mlstatic.com/697144-MLA44156107576_112020-F.jpg"),
            ProductListItem(id: "MCO6127579", name: "iPhone 6s 128 GB oro", image: "https://http2.mlstatic.com/D_NQ_NP_866492-MLU75320663407_032024-F.jpg"),
            ProductListItem(id: "MCO6007280", name: "iPhone 5c 8 GB azul", image: "https://http2.mlstatic.com/D_NQ_NP_980296-MLA44156183856_112020-F.jpg")
        ]
        
        //Then
        XCTAssertNotEqual(sut.products.count, 0)
        XCTAssertEqual(sut.products.count, 5)
        XCTAssertEqual(sut.products, listReference)
    }
    
    func testGetListTwoTimesSucces() async throws {
        //Give
        let query = "iphone"
        let countrySite = "MCO"
        //When
        await sut.loadProductList(query: query, countrySite: countrySite)
        await sut.loadProductList(query: query, countrySite: countrySite)
        let listReference: [ProductListItem] = [
            ProductListItem(id: "MCO30400479", name: " iPhone 3G", image: "https://http2.mlstatic.com/D_NQ_NP_796973-MLA28284457453_102018-F.jpg"),
            ProductListItem(id: "MCO6345170", name: "Apple Iphone se iPhone SE - Plata - 32 GB - 2 GB", image: "https://http2.mlstatic.com/D_NQ_NP_726769-MLU75333762318_032024-F.jpg"),
            ProductListItem(id: "MCO6037349", name: "iPhone 4s 8 GB negro", image: "https://mla-s2-p.mlstatic.com/697144-MLA44156107576_112020-F.jpg"),
            ProductListItem(id: "MCO6127579", name: "iPhone 6s 128 GB oro", image: "https://http2.mlstatic.com/D_NQ_NP_866492-MLU75320663407_032024-F.jpg"),
            ProductListItem(id: "MCO6007280", name: "iPhone 5c 8 GB azul", image: "https://http2.mlstatic.com/D_NQ_NP_980296-MLA44156183856_112020-F.jpg"),
            ProductListItem(id: "MCO6007283", name: "iPhone 5c 8 GB amarillo", image: "https://http2.mlstatic.com/D_NQ_NP_796617-MLA44156182886_112020-F.jpg"),
            ProductListItem(id: "MCO6007284", name: "iPhone 5c 32 GB verde", image: "https://http2.mlstatic.com/D_NQ_NP_802529-MLA44156183886_112020-F.jpg"),
            ProductListItem(id: "MCO24156590", name: "iPhone 14 256 GB amarillo", image: "https://http2.mlstatic.com/D_NQ_NP_733258-MLA74807972917_022024-F.jpg"),
            ProductListItem(id: "MCO24156592", name: "iPhone 14 512 GB amarillo", image: "https://http2.mlstatic.com/D_NQ_NP_733258-MLA74807972917_022024-F.jpg"),
            ProductListItem(id: "MCO6345175", name: "iPhone SE 128 GB oro", image: "https://mla-s2-p.mlstatic.com/934483-MLA31252730076_062019-F.jpg"),
        ]
        
        //Then
        XCTAssertNotEqual(sut.products.count, 0)
        XCTAssertEqual(sut.products.count, 10)
        XCTAssertEqual(sut.products, listReference)
        XCTAssertEqual(sut.pagingCounter, 2)
    }
    
    func testNotFoundNameProduct() async{
        //Give
        
        let query = "sdasdasdasdasd"
        let countrySite = "MCO"
        
        //When
        await sut.loadProductList(query: query, countrySite: countrySite)
        
        //Then
        XCTAssertEqual(sut.products.count, 0)
        XCTAssertEqual(sut.products, [])
        XCTAssertEqual(sut.errorMessage, "No hay ningun producto con ese nombre.")
        XCTAssertEqual(sut.ShowErrorMessage, true)
    }
    
}


