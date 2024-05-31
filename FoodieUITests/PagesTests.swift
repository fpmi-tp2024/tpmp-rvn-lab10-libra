//
//  PagesTests.swift
//  FoodieUITests
//
//  Created by lev on 29.05.24.
//

import XCTest

class PagesTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testPagesSwitching() throws {
        let app = XCUIApplication()
        app.launch()
    
        UITestsHelper.registerSuccessfully(in: app)
    
        let tabBar = app.tabBars["Tab Bar"]
        
        tabBar.buttons["CartButton"].tap()
        UITestsHelper.waitForSeconds(5)
        XCTAssertTrue(app.buttons["PayButton"].exists)
        
        tabBar.buttons["SettingsButton"].tap()
        UITestsHelper.waitForSeconds(5)
        XCTAssertTrue(app.scrollViews.otherElements.switches["SwitchThemeToggle"].exists)
        
        tabBar.buttons["MenuButton"].tap()
        UITestsHelper.waitForSeconds(5)
        XCTAssertTrue(app.textFields["SearchField"].exists)
        
    }

}
