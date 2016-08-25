//
//  TutoUserUITests.swift
//  TutoUserUITests
//
//  Created by Benjamin Dumont on 16/03/2016.
//  Copyright © 2016 bdumont. All rights reserved.
//

import XCTest

class TutoUserUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testAppli() {
        
        let app = XCUIApplication()
        let userListNavigationBar = app.navigationBars["User List"]

        XCTAssertTrue(userListNavigationBar.staticTexts["User List"].exists)
        XCTAssertTrue(app.tables["No Result"].staticTexts["No Result"].exists)
        
        userListNavigationBar.buttons["Add"].tap()
        
        let returnButton = app.buttons["Return"]
        let firstnameTextField = app.textFields["Firstname"]
        XCTAssertTrue(firstnameTextField.exists)
        firstnameTextField.tap()
        firstnameTextField.typeText("Benjamin")
        returnButton.tap()
        
        let lastnameTextField = app.textFields["Lastname"]
        XCTAssertTrue(lastnameTextField.exists)
        lastnameTextField.tap()
        lastnameTextField.typeText("Dumont")
        returnButton.tap()

        app.buttons["Save"].tap()
        
        let tablesQuery = app.tables
        XCTAssertTrue(tablesQuery.staticTexts["Dumont"].exists)
        
        let cell = tablesQuery.cells.staticTexts["Dumont"]
        cell.swipeLeft()
        
        app.tables.buttons["Delete"].tap()
        XCTAssertTrue(app.tables["No Result"].staticTexts["No Result"].exists)



    }
    
}
