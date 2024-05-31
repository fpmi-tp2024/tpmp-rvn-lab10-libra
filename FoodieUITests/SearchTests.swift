//
//  SearchTests.swift
//  FoodieUITests
//
//  Created by lev on 29.05.24.
//

import XCTest

class SearchTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testSearchField() {
        let app = XCUIApplication()
        app.launch()
    
        UITestsHelper.registerSuccessfully(in: app)
    
        let searchfieldTextField = app.textFields["SearchField"]
        let elementsQuery = app.scrollViews.otherElements
        
        searchfieldTextField.tap()
        searchfieldTextField.typeText("burger")
        UITestsHelper.waitForSeconds(3)
        
        XCTAssertTrue(elementsQuery.images["burger"].exists)
        
        UITestsHelper.clearText(textField: searchfieldTextField)
        searchfieldTextField.tap()
        searchfieldTextField.typeText("f")
        UITestsHelper.waitForSeconds(3)
        
        XCTAssertTrue(elementsQuery.images["coffee"].exists)
        XCTAssertTrue(elementsQuery.images["frenchFries"].exists)
        XCTAssertTrue(elementsQuery.images["friedChicken"].exists)
        
    }

}
