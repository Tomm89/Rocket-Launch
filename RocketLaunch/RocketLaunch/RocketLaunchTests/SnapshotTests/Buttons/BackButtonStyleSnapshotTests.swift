//
//  BackButtonStyleSnapshotTests.swift
//  RocketLaunchTests
//
//  Created by Tomáš Brand on 20.11.2023.
//

@testable import UIToolkit
import SnapshotTesting
import SwiftUI
import XCTest

final class BackButtonStyleSnapshotTests: XCTestCase {
    
    // MARK: - Tests
    
    func testBackButtonStyle() {
        let button = Button("") {}
            .buttonStyle(BackButtonStyle())
        
        assertSnapshot(of: button, as: .image)
    }
}
