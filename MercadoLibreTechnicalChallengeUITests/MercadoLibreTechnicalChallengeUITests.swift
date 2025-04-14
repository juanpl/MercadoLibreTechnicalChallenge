//
//  MercadoLibreTechnicalChallengeUITests.swift
//  MercadoLibreTechnicalChallengeUITests
//
//  Created by Juan Pablo Lasprilla Correa on 13/04/25.
//

import XCTest

final class MercadoLibreTechnicalChallengeUITests: XCTestCase {

    func testExample() throws {
        
        
        let app = XCUIApplication()
        app.launch()
        app.textFields["Buscando producto...🔍"].tap()
        app.textFields["Buscando producto...🔍"].typeText("Iphone")
        app.buttons["Buscar"].tap()
        
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["iPhone 4s 8 GB negro"]/*[[".cells.buttons[\"iPhone 4s 8 GB negro\"]",".buttons[\"iPhone 4s 8 GB negro\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let element = elementsQuery.collectionViews.cells.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.swipeLeft()
        element.swipeLeft()
        element.swipeLeft()
         
        
        let backButton = app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Back"]
        backButton.tap()
        backButton.tap()
        
            

                
        

        

                
        
    }

}
