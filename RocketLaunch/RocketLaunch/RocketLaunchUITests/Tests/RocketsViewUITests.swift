//
//  RocketsViewUITests.swift
//  RocketLaunchUITests
//
//  Created by Tomáš Brand on 21.11.2023.
//

import XCTest

final class RocketsViewUITests: UITestCase {

    // MARK: - Default methods
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    // MARK: - Tests
    
    func testRocketsScreen() {
        let app = XCUIApplication()
        launch(app: app)
        print(app.debugDescription)
        
        let rocketsScreen = RocketsScreen(inApp: app)

        assertElement(rocketsScreen.rocketsTitle, exist: true)
        assertElement(rocketsScreen.rocketsList, exist: true)
    }
    
    func testRocketsListScreen_OpenDetail() {
        let app = XCUIApplication()
        launch(app: app)
        
        let rocketsScreen = RocketsScreen(inApp: app)
        rocketsScreen.tapOnRocketInList()

        assertElement(app.staticTexts["Rocket Title"], exist: true)
    }
}
