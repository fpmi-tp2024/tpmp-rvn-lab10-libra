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

    func testSuccessfulRegistration() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["Register"].tap()

        let emailTextField = app.textFields["lEmail"]
        let loginTextField = app.textFields["tLogin"]
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let passwordTextField = element.children(matching: .secureTextField).matching(identifier: "lPassword").element(boundBy: 0)
        let confirmPasswordTextField = element.children(matching: .secureTextField).matching(identifier: "lPassword").element(boundBy: 1)

        emailTextField.tap()
        emailTextField.typeText("test@example.com")

        loginTextField.tap()
        loginTextField.typeText("user")

        passwordTextField.tap()
        passwordTextField.typeText("p")

        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("p")

        app.buttons["Confirm"].tap()

        XCTAssertFalse(app.alerts["Error"].exists)
        
        XCTAssert(element.waitForExistence(timeout: 15))
        
        XCTAssertTrue(app.textFields["tSearch"].exists)
    }
    
    func testFailedRegistrationNotMatchingPasswords() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["Register"].tap()

        let emailTextField = app.textFields["lEmail"]
        let loginTextField = app.textFields["tLogin"]
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let passwordTextField = element.children(matching: .secureTextField).matching(identifier: "lPassword").element(boundBy: 0)
        let confirmPasswordTextField = element.children(matching: .secureTextField).matching(identifier: "lPassword").element(boundBy: 1)

        emailTextField.tap()
        emailTextField.typeText("test@example.com")

        loginTextField.tap()
        loginTextField.typeText("user")

        passwordTextField.tap()
        passwordTextField.typeText("p")

        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("passss")

        app.buttons["Confirm"].tap()

        XCTAssertTrue(app.alerts["Error"].exists)
    }
    
    func testFailedRegistration() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["Register"].tap()

        let emailTextField = app.textFields["lEmail"]
        let loginTextField = app.textFields["tLogin"]
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let passwordTextField = element.children(matching: .secureTextField).matching(identifier: "lPassword").element(boundBy: 0)
        let confirmPasswordTextField = element.children(matching: .secureTextField).matching(identifier: "lPassword").element(boundBy: 1)

        emailTextField.tap()
        emailTextField.typeText("test@example.com")

        loginTextField.tap()
        loginTextField.typeText("")

        passwordTextField.tap()
        passwordTextField.typeText("")

        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("")

        app.buttons["Confirm"].tap()

        XCTAssertTrue(app.alerts["Error"].exists)
    }



}
