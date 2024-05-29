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
        
            UITestsHelper.registerSuccessfully(in: app)
            app.buttons["BackButton"].tap()
            app.buttons["OK"].tap()

            app.buttons["LoginButton"].tap()

            // Type the username.
            let usernameTextField = app.textFields["LoginField"]
            usernameTextField.tap()
            usernameTextField.typeText("user")

            // Type the password.
            let passwordTextField = app.secureTextFields["PasswordField"]
            passwordTextField.tap()
            passwordTextField.typeText("p")

            // Tap the login button.
            app.buttons["ConfirmButton"].tap()
        
            UITestsHelper.waitForSeconds(5)

            XCTAssertTrue(app.textFields["SearchField"].exists)
        }

        func testFailedLogin() {
            // UI tests must launch the application that they test.
            let app = XCUIApplication()
            app.launch()

            app.buttons["LoginButton"].tap()

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
