//
//  PaymentTests.swift
//  FoodieUITests
//
//  Created by lev on 29.05.24.
//

import XCTest

class PaymentTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testAddToCart() throws {
        let app = XCUIApplication()
        app.launch()
    
        UITestsHelper.registerSuccessfully(in: app)
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons["$3.25"].tap()
        elementsQuery.buttons["$3.25"].tap()
        elementsQuery.buttons["$5.50"].tap()
        UITestsHelper.waitForSeconds(2)
        
        app.tabBars["Tab Bar"].buttons["CartButton"].tap()
        UITestsHelper.waitForSeconds(2)
        
        let tablesQuery = app.tables
        XCTAssertTrue(tablesQuery.children(matching: .cell).matching(identifier: "coffee, Coffee, $3.25").element(boundBy: 0).exists)
        XCTAssertTrue(tablesQuery.children(matching: .cell).matching(identifier: "coffee, Coffee, $3.25").element(boundBy: 1).exists)
        XCTAssertTrue(tablesQuery.children(matching: .cell).matching(identifier: "burger, Burger, $5.50").element(boundBy: 0).exists)
        
        XCTAssertTrue(app.staticTexts["$12.00"].exists)
        XCTAssertFalse(app.staticTexts["$0.00"].exists)
    }
    
    func testPayCard() throws {
        let app = XCUIApplication()
        app.launch()
    
        UITestsHelper.registerSuccessfully(in: app)
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons["$3.25"].tap()
        elementsQuery.buttons["$3.25"].tap()
        elementsQuery.buttons["$5.50"].tap()
        UITestsHelper.waitForSeconds(2)
        
        app.tabBars["Tab Bar"].buttons["CartButton"].tap()
        UITestsHelper.waitForSeconds(2)
    
        app.buttons["PayButton"].tap()
        UITestsHelper.waitForSeconds(2)
        
        let elementsQuery2 = app.scrollViews.otherElements
        
        let tablesQuery = elementsQuery2.tables
        
        tablesQuery.textFields["Cardholder's Name"].tap()
        tablesQuery.textFields["Cardholder's Name"].typeText("max")
        
        tablesQuery.textFields["Card Nubmer"].tap()
        tablesQuery.textFields["Card Nubmer"].typeText("1111 1111 1111 1111")
        
        tablesQuery.textFields["Expiry Date"].tap()
        tablesQuery.textFields["Expiry Date"].typeText("11/11/2023")
        
        tablesQuery.textFields["CCV"].tap()
        tablesQuery.textFields["CCV"].typeText("223")
        
        let deliveryAdressTextField = elementsQuery2.textFields["Delivery Adress"]
        deliveryAdressTextField.tap()
        deliveryAdressTextField.typeText("Minsk")
        elementsQuery2.buttons["Confirm Pay"].tap()
        
        XCTAssertFalse(app.staticTexts["$12.00"].exists)
        XCTAssertTrue(app.staticTexts["$0.00"].exists)
        
    }
    
    func testPayCash() throws {
        let app = XCUIApplication()
        app.launch()
    
        UITestsHelper.registerSuccessfully(in: app)
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons["$3.25"].tap()
        elementsQuery.buttons["$3.25"].tap()
        elementsQuery.buttons["$5.50"].tap()
        UITestsHelper.waitForSeconds(2)
        
        app.tabBars["Tab Bar"].buttons["CartButton"].tap()
        UITestsHelper.waitForSeconds(2)
        
        app.buttons["PayButton"].tap()
        UITestsHelper.waitForSeconds(5)
        
        let elementsQuery2 = app.scrollViews.otherElements
        elementsQuery2/*@START_MENU_TOKEN@*/.buttons["Cash"]/*[[".segmentedControls.buttons[\"Cash\"]",".buttons[\"Cash\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        UITestsHelper.waitForSeconds(5)
    }
    
}
