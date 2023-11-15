//
//  LaunchButtonStyleSnapshotTests.swift
//  RocketLaunchTests
//
//  Created by Tomáš Brand on 20.11.2023.
//

@testable import UIToolkit
import SnapshotTesting
import SwiftUI
import XCTest

final class LaunchButtonStyleSnapshotTests: XCTestCase {
    
    // MARK: - Tests
    
    func testLaunchButtonStyle() {
        let button = Button(Strings.rocketLaunchButtonTitle) {}
            .buttonStyle(LaunchButtonStyle())
        
        assertSnapshot(of: button, as: .image)
    }
}
