//
//  PhotosButtonStyleSnapshotTests.swift
//  RocketLaunchTests
//
//  Created by Tomáš Brand on 20.11.2023.
//

@testable import UIToolkit
import SnapshotTesting
import SwiftUI
import XCTest

final class PhotosButtonStyleSnapshotTests: XCTestCase {
    
    // MARK: - Tests
    
    func testPhotosButtonStyle() {
        let button = Button(Strings.rocketPhotosButtonTitle) {}
            .buttonStyle(PhotosButtonStyle())
        
        assertSnapshot(of: button, as: .image)
    }
}
