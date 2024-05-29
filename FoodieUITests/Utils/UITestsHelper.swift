//
//  UITestsHelper.swift
//  FoodieUITests
//
//  Created by lev on 29.05.24.
//

import Foundation
import XCTest

class UITestsHelper {
    
    static func registerSuccessfully(in app: XCUIApplication) {
        app.buttons["RegisterButton"].tap()

        let emailTextField = app.textFields["EmailField"]
        let loginTextField = app.textFields["LoginField"]
        let passwordTextField = app.secureTextFields["PasswordField"]
        let confirmPasswordTextField = app.secureTextFields["ConfirmPasswordField"]

        emailTextField.tap()
        emailTextField.typeText("test@example.com")

        loginTextField.tap()
        loginTextField.typeText("user")

        passwordTextField.tap()
        passwordTextField.typeText("p")

        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("p")

        app.buttons["ConfirmButton"].tap()
        
        waitForSeconds(5)
    }
    
    // Wait for a specific amount of time
    static func waitForSeconds(_ seconds: Double) {
        let expectation = XCTestExpectation(description: "Wait for \(seconds) seconds")
        let result = XCTWaiter.wait(for: [expectation], timeout: seconds)
        XCTAssertEqual(result, .timedOut)
    }
    
}
