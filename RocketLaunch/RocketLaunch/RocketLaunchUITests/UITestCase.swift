//
//  UITestCase.swift
//  RocketLaunchUITests
//
//  Created by Tomáš Brand on 21.11.2023.
//

import XCTest

class UITestCase: XCTestCase {
    
    // MARK: Private properties
    
    private var monitor: NSObjectProtocol?
    
    // MARK: Default methods
    
    override func tearDown() {
        super.tearDown()
        XCUIApplication().terminate()
    }
    
    // MARK: Methods
    
    func assertElement(_ element: XCUIElement, exist: Bool, file: StaticString = #file, line: UInt = #line) {
        let elementPresent = element.waitForExistence(timeout: 6)
        if exist {
            XCTAssertTrue(elementPresent, "Element not present", file: file, line: line)
        } else {
            XCTAssertFalse(elementPresent, "Element present", file: file, line: line)
        }
    }

    func assertElement(_ element: XCUIElement, enabled: Bool) {
        let elementPresent = element.waitForExistence(timeout: 6)
        if elementPresent {
            XCTAssertEqual(enabled, element.isEnabled)
        } else {
            XCTFail("Element not present")
        }
    }
    
    func launch(app: XCUIApplication, launchArguments: [String] = []) {
        app.launchArguments += launchArguments
        app.launch()
        // the following will be active during the entire test run
        // this means any alert will be affected
        monitor = addUIInterruptionMonitor(withDescription: "System Dialog") { alert -> Bool in
            if alert.buttons["Allow"].exists {
                alert.buttons["Allow"].tap()
                app.tap()
                return true
            } else if alert.buttons["Allow While Using App"].exists {
                alert.buttons["Allow While Using App"].tap()
                app.tap()
                return true
            } else if alert.buttons["Teď ne"].exists {
                alert.buttons["Teď ne"].tap()
                app.tap()
                return true
            }
            sleep(10)
            return false
        }
    }
}
