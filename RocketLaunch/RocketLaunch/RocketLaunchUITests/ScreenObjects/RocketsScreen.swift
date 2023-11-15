//
//  RocketsScreen.swift
//  RocketLaunchUITests
//
//  Created by Tomáš Brand on 21.11.2023.
//

import XCTest

class RocketsScreen: BaseScreen {

    // MARK: - Private Properties
    
    private(set) lazy var rocketsTitle = app.staticTexts["Rockets"]
    private(set) lazy var rocketsList = app.collectionViews["Rockets List"]
    
    // MARK: - Public Methods
    
    func tapOnRocketInList() {
        rocketsList.otherElements.firstMatch.waitAndTap()
    }
}

