//
//  XCUIElement+Extensions.swift
//  RocketLaunchUITests
//
//  Created by Tomáš Brand on 21.11.2023.
//

import Foundation
import XCTest

extension XCUIElement {
    func labelContains(text: String) -> Bool {
        let predicate = NSPredicate(format: "label CONTAINS %@", text)
        return staticTexts.matching(predicate).firstMatch.exists
    }
    
    func forceTap(offset: CGVector = CGVector(dx: 0.0, dy: 0.0)) {
        if self.isHittable {
            self.tap()
        } else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: offset)
            coordinate.tap()
        }
    }
    
    func waitAndTap(after time: TimeInterval = 10, force: Bool = false) {
        XCTAssert(self.waitForExistence(timeout: time))
        if force {
            self.forceTap()
        } else {
            self.tap()
        }
    }
    
    func clearText() {
        guard let stringValue = self.value as? String else {
            return
        }
        // workaround for apple bug
        if let placeholderString = self.placeholderValue, placeholderString == stringValue {
            return
        }

        var deleteString = String()
        for _ in stringValue {
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        typeText(deleteString)
    }
    
    func safeType(_ text: String, app: XCUIApplication) {
        guard let first = text.first?.lowercased() else { return }
        _ = app.keys[String(first)].waitForExistence(timeout: 10)
        
        for character in text {
            if character.isUppercase {
                app.keyboards.buttons["shift"].tap()
            } else if character.isNumber {
                app.keys["more"].tap()
            }
            
            app.keys[String(character)].tap()
            
            if character.isNumber {
                app.keys["more"].tap()
            }
        }
    }
}
