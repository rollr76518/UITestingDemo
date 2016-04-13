//
//  ListerUITests.swift
//  ListerUITests
//
//  Created by Hanyu on 2016/4/2.
//  Copyright © 2016年 Apple Inc. All rights reserved.
//

import XCTest

class ListerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    
    func testDelete() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Groceries"].tap()
        
        let count = tablesQuery.cells.count
        
        let groceriesNavigationBarsQuery = app.navigationBars.matchingIdentifier("Groceries")
        groceriesNavigationBarsQuery.buttons["Edit"].tap()
        tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(1).buttons["Delete "].tap()
        tablesQuery.buttons["Delete"].tap()
        groceriesNavigationBarsQuery.buttons["Done"].tap()
        
        XCTAssertEqual(tablesQuery.cells.count, count - 1)
    }
    
    func testAdd() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Groceries"].tap()
        
        let count = tablesQuery.cells.count
        
        let tableTextField = tablesQuery.textFields["Add Item"]
        tableTextField.tap()
        tableTextField.typeText("cookies")
        app.buttons["Done"].tap()
        
        XCTAssertEqual(tablesQuery.cells.count, count + 1)
    }
    
    func testColor() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Groceries"].tap()
        
        let groceriesNavigationBarsQuery = app.navigationBars.matchingIdentifier("Groceries")
        groceriesNavigationBarsQuery.buttons["Edit"].tap()
        tablesQuery.buttons["red"].tap()
        tablesQuery.buttons["orange"].tap()
        tablesQuery.buttons["yellow"].tap()
        tablesQuery.buttons["green"].tap()
        tablesQuery.buttons["blue"].tap()
        tablesQuery.buttons["black"].tap()
        groceriesNavigationBarsQuery.buttons["Done"].tap()
    }
}
