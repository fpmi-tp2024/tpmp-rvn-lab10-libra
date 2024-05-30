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
        
        XCTAssertTrue(app.staticTexts["0coffee"].exists)
        XCTAssertTrue(app.staticTexts["1coffee"].exists)
        XCTAssertTrue(app.staticTexts["2burger"].exists)
        
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
        
        let cardHolderNameTextField = app.textFields["cardHolderNameTextField"]
        let cardNumberTextField = app.textFields["cardNumberTextField"]
        let expirationDateTextField = app.textFields["expirationDateTextField"]
        let ccvCodeTextField = app.textFields["ccvCodeTextField"]

        cardHolderNameTextField.tap()
        cardHolderNameTextField.typeText("max")

        cardNumberTextField.tap()
        cardNumberTextField.typeText("1111 1111 1111 1111")

        expirationDateTextField.tap()
        expirationDateTextField.typeText("11/11/2023")

        ccvCodeTextField.tap()
        ccvCodeTextField.typeText("223")
        
        let deliveryAdressTextField = elementsQuery2.textFields["adressTextField"]
        deliveryAdressTextField.tap()
        deliveryAdressTextField.typeText("Minsk")
        elementsQuery2.buttons["confirmButton"].tap()
        
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
        
        app.buttons["PayCashPick"].tap()
        UITestsHelper.waitForSeconds(5)
        
        let deliveryAdressTextField = app.scrollViews.otherElements.textFields["adressTextField"]
        deliveryAdressTextField.tap()
        deliveryAdressTextField.typeText("Minsk")
        
        app.buttons["confirmButton"].tap()
        
        XCTAssertFalse(app.staticTexts["$12.00"].exists)
        XCTAssertTrue(app.staticTexts["$0.00"].exists)
    }
    
}
