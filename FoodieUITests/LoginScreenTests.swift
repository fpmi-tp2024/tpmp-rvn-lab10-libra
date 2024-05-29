//
//  LoginScreenTests.swift
//  FoodieUITests
//
//  Created by lev on 28.05.24.
//

import XCTest

class LoginScreenTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testSuccessfulLogin() {
            // UI tests must launch the application that they test.
            let app = XCUIApplication()
            app.launch()

            app.buttons["Login"].tap()

            // Type the username.
            let usernameTextField = app.textFields["LoginField"]
            usernameTextField.tap()
            usernameTextField.typeText("1")

            // Type the password.
            let passwordTextField = app.secureTextFields["PasswordField"]
            passwordTextField.tap()
            passwordTextField.typeText("1")

            // Tap the login button.
            app.buttons["ConfirmButton"].tap()

            // Check that the login screen is no longer visible.
            XCTAssertFalse(app.navigationBars["Login"].exists)
        }

        func testFailedLogin() {
            // UI tests must launch the application that they test.
            let app = XCUIApplication()
            app.launch()

            app.buttons["Login"].tap()

            // Type the username.
            let usernameTextField = app.textFields["LoginField"]
            usernameTextField.tap()
            usernameTextField.typeText("1")

            // Type the wrong password.
            let passwordTextField = app.secureTextFields["PasswordField"]
            passwordTextField.tap()
            passwordTextField.typeText("2")

            // Tap the login button.
            app.buttons["ConfirmButton"].tap()

            // Check that the error alert is visible.
            XCTAssertTrue(app.alerts["Error"].exists)

            // Tap the OK button on the error alert.
            app.buttons["OK"].tap()

            // Check that the login screen is still visible.
            XCTAssertTrue(app.buttons["ConfirmButton"].exists)
        }

}
