//
//  SettingTests.swift
//  FoodieUITests
//
//  Created by lev on 29.05.24.
//

import XCTest

class SettingTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testThemeSwitching() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Ensure the app is registered and navigated to the Settings page
        UITestsHelper.registerSuccessfully(in: app)
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["SettingsButton"].tap()
        UITestsHelper.waitForSeconds(5)
        
        // Locate the theme switch toggle
        let themeToggle = app.scrollViews.otherElements.switches["SwitchThemeToggle"]
        XCTAssertTrue(themeToggle.exists, "The theme toggle should exist")
        
        // Check initial state
        let initialValue = themeToggle.value as! String
        XCTAssertTrue(initialValue == "0" || initialValue == "1", "The theme toggle should be either '0' or '1'")
        
        // Toggle the theme switch
        themeToggle.tap()
        UITestsHelper.waitForSeconds(2) // Wait for the theme change to apply
            
        // Verify the toggle state has changed
        let newValue = themeToggle.value as! String
        XCTAssertNotEqual(initialValue, newValue, "The theme toggle value should change after tapping")
        
        // Optional: Reset the theme to its original state for consistent test results
        themeToggle.tap()
        UITestsHelper.waitForSeconds(2)
        let resetValue = themeToggle.value as! String
        XCTAssertEqual(initialValue, resetValue, "The theme toggle value should reset to initial state")
    }

    func testUpdateFailed() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Ensure the app is registered and navigated to the Settings page
        UITestsHelper.registerSuccessfully(in: app)
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["SettingsButton"].tap()
        UITestsHelper.waitForSeconds(5)
        
        let scrollViewsQuery = app.scrollViews
        let personElement = scrollViewsQuery.otherElements.containing(.image, identifier:"person").element
        personElement.swipeUp()
        
        let elementsQuery = scrollViewsQuery.otherElements
        elementsQuery.buttons["UpdateButton"].tap()
        UITestsHelper.waitForSeconds(5)
        
        XCTAssertTrue(app.alerts["Failure"].exists)
    }
    
    func testSuccessfulUpdate() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Ensure the app is registered and navigated to the Settings page
        UITestsHelper.registerSuccessfully(in: app)
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["SettingsButton"].tap()
        UITestsHelper.waitForSeconds(5)
        
        let scrollViewsQuery = app.scrollViews
        
        let elementsQuery = scrollViewsQuery.otherElements
        
        app.textFields["UpdateLoginField"].tap()
        app.textFields["UpdateLoginField"].typeText("new")
        
        app.textFields["UpdateEmailField"].tap()
        app.textFields["UpdateEmailField"].typeText("new")
        
        app.secureTextFields["UpdatePasswordField"].tap()
        app.secureTextFields["UpdatePasswordField"].typeText("new")
        
        elementsQuery.buttons["UpdateButton"].tap()
        UITestsHelper.waitForSeconds(5)
        
        XCTAssertTrue(app.alerts["Success"].exists)
        XCTAssertFalse(app.alerts["Failure"].exists)
        app.buttons["OK"].tap()
        
        app.tabBars["Tab Bar"].buttons["MenuButton"].tap()
        UITestsHelper.waitForSeconds(5)
        
        app.buttons["BackButton"].tap()
        app.buttons["OK"].tap()

        app.buttons["LoginButton"].tap()

        // Type the username.
        let usernameTextField = app.textFields["LoginField"]
        usernameTextField.tap()
        usernameTextField.typeText("new")

        // Type the password.
        let passwordTextField = app.secureTextFields["PasswordField"]
        passwordTextField.tap()
        passwordTextField.typeText("new")

        // Tap the login button.
        app.buttons["ConfirmButton"].tap()
    
        UITestsHelper.waitForSeconds(5)

        XCTAssertTrue(app.textFields["SearchField"].exists)
    }
}
