//
//  RocketCellSnapshotTests.swift
//  RocketLaunchTests
//
//  Created by Tomáš Brand on 20.11.2023.
//

@testable import UIToolkit
import SnapshotTesting
import XCTest

final class RocketCellSnapshotTests: XCTestCase {

    // MARK: - Tests

    func testRocketCellView() {
        let cell = RocketCellView(title: "Rocket 1", text: "2023-11-20")
            .frame(width: 300, height: 56)
            .padding(.vertical, Dimension.paddingMediumLarge)
            .padding(.horizontal, Dimension.paddingLarge)
        
        assertSnapshot(of: cell, as: .image)
    }
}
