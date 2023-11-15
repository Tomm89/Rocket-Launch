//
//  XCUIApplication+Extensions.swift
//  RocketLaunchUITests
//
//  Created by Tomáš Brand on 21.11.2023.
//

import Foundation
import XCTest

extension XCUIApplication {
    func showKeyboard() {
        _ = self.keyboards.element.waitForExistence(timeout: 10)
    }
}
