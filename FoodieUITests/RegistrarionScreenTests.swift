//
//  RegistrarionScreenTests.swift
//  FoodieUITests
//
//  Created by lev on 29.05.24.
//

import XCTest

class RegistrarionScreenTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func registerSuccessfully(in app: XCUIApplication) {
        app.buttons["Register"].tap()

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
    }


    func testSuccessfulRegistration() throws {
        let app = XCUIApplication()
        app.launch()

        registerSuccessfully(in: app)

        XCTAssertFalse(app.alerts["Error"].exists)

        // Wait for a specific amount of time
        let expectation = XCTestExpectation(description: "Wait for 5 seconds")
        let result = XCTWaiter.wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(result, .timedOut)

        XCTAssertTrue(app.textFields["SearchField"].exists)
    }

    
    func testFailedRegistrationNotMatchingPasswords() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["Register"].tap()

        let emailTextField = app.textFields["EmailField"]
        let loginTextField = app.textFields["LoginField"]
        let passwordTextField = app.secureTextFields["PasswordField"]
        let confirmPasswordTextField = app.secureTextFields["ConfirmPasswordField"]

        emailTextField.tap()
        emailTextField.typeText("test@example.com")

        loginTextField.tap()
        loginTextField.typeText("user")

        passwordTextField.tap()
        passwordTextField.typeText("mmpfsdfdf")

        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("bpafsssss")

        app.buttons["ConfirmButton"].tap()
        
        // Wait for a specific amount of time
        let expectation = XCTestExpectation(description: "Wait for 5 seconds")
        let result = XCTWaiter.wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(result, .timedOut)

        //XCTAssertTrue(app.alerts["Error"].exists)
    }
    
    func testFailedRegistration() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["Register"].tap()

        let emailTextField = app.textFields["EmailField"]
        let loginTextField = app.textFields["LoginField"]
        let passwordTextField = app.secureTextFields["PasswordField"]
        let confirmPasswordTextField = app.secureTextFields["ConfirmPasswordField"]

        emailTextField.tap()
        emailTextField.typeText("test@example.com")

        loginTextField.tap()
        loginTextField.typeText("")

        passwordTextField.tap()
        passwordTextField.typeText("")

        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("")

        app.buttons["ConfirmButton"].tap()
        
        // Wait for a specific amount of time
        let expectation = XCTestExpectation(description: "Wait for 5 seconds")
        let result = XCTWaiter.wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(result, .timedOut)

        XCTAssertTrue(app.alerts["Error"].exists)
    }

}
