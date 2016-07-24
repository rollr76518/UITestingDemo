//
//  ListerUITests.swift
//  ListerUITests
//
//  Created by Hanyu on 2016/4/2.
//  Copyright © 2016年 Apple Inc. All rights reserved.
//

import XCTest

let FIRST_CELL_TITLE = "Groceries"

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
        //初始化
        let app = XCUIApplication()
        
        //從第一頁進到第二頁
        let tablesQuery = app.tables
        
        let firstCell = tablesQuery.staticTexts[FIRST_CELL_TITLE]
        firstCell.tap()
        
        //第二頁按編輯之後刪除
        let orignalCount = tablesQuery.cells.count
        
        let groceriesNavigationBarsQuery = app.navigationBars.matchingIdentifier(FIRST_CELL_TITLE)
        let buttonEdit = groceriesNavigationBarsQuery.buttons["Edit"]
        buttonEdit.tap()
        
        let firstItem = tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(1)
        firstItem.buttons["Delete "].tap()
        firstItem.buttons["Delete"].tap()
         
        let buttonDone = groceriesNavigationBarsQuery.buttons["Done"]
        buttonDone.tap()

        let newCount = tablesQuery.cells.count
        
        //檢查刪除前跟刪除後是否少1
        XCTAssertEqual(newCount, orignalCount - 1)
    }
    
    func testAdd() {
        //初始化
        let app = XCUIApplication()
        
        //從第一頁進到第二頁
        let tablesQuery = app.tables
        let firstCell = tablesQuery.staticTexts[FIRST_CELL_TITLE]
        firstCell.tap()
        
        //第二頁按新增之後增加
        let orignalCount = tablesQuery.cells.count
        
        let tableTextField = tablesQuery.textFields["Add Item"]
        tableTextField.tap()
        tableTextField.typeText("cookies")
        app.buttons["Done"].tap()
        
        let newCount = tablesQuery.cells.count
        
        //檢查新增前跟新增後是否加1
        XCTAssertEqual(newCount, orignalCount + 1)
    }
    
    func testColor() {
        //初始化
        let app = XCUIApplication()
        
        //從第一頁進到第二頁
        let tablesQuery = app.tables
        let firstCell = tablesQuery.staticTexts[FIRST_CELL_TITLE]
        firstCell.tap()
        
        //第二頁按編輯之後點擊各個 button(ID)
        let groceriesNavigationBarsQuery = app.navigationBars.matchingIdentifier(FIRST_CELL_TITLE)
        groceriesNavigationBarsQuery.buttons["Edit"].tap()
        let redButton = tablesQuery.buttons["red"]
        redButton.tap()
        //可以測試 identifier 是否正確，但無法測試顏色
        XCTAssertEqual(redButton.identifier, "red")
        
//        XCUIApplication().tables.childrenMatchingType(.Cell).elementBoundByIndex(1).buttons["Reorder"].tap()
        
        tablesQuery.buttons["orange"].tap()
        tablesQuery.buttons["yellow"].tap()
        tablesQuery.buttons["green"].tap()
        tablesQuery.buttons["blue"].tap()
        tablesQuery.buttons["black"].tap()
        groceriesNavigationBarsQuery.buttons["Done"].tap()
    }
    
    func testForButton() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Groceries"].tap()
        
        let groceriesNavigationBarsQuery = app.navigationBars.matchingIdentifier("Groceries")
        groceriesNavigationBarsQuery.buttons["Edit"].tap()
        
        
//        let reorderButton = XCUIApplication().tables.childrenMatchingType(.Cell).elementBoundByIndex(1).buttons["Reorder"]
//        reorderButton.swipeUp()

        tablesQuery.buttons["Oranges"].tap()
//        groceriesNavigationBarsQuery.buttons["Done"].tap()
        
        
        
    }
}
