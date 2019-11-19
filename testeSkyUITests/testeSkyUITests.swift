//
//  testeSkyUITests.swift
//  testeSkyUITests
//
//  Created by Gabriel Sousa on 18/11/19.
//  Copyright © 2019 Gabriel Sousa. All rights reserved.
//

import XCTest

class testeSkyUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        app = XCUIApplication()
        app.terminate()
        continueAfterFailure = false
        app.launch()
       
    }

    override func tearDown() {
        app.terminate()
    }
    
    func testarFluxo() {

        
        let app = XCUIApplication()
    
        //ESPERAR 3 SEGUNDOS PARA CARREGAR A COLLECTION VIEW
        sleep(3)
        
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element.swipeUp()
        app.collectionViews.cells.otherElements.containing(.staticText, identifier:"Capitão América: Guerra Civil").element.tap()
        app.scrollViews.children(matching: .image).element.swipeLeft()
        app.buttons["arrow.left"].tap()
      
        
        
        
    }

}

