//
//  RocketsRepositoryTests.swift
//  RocketLaunchTests
//
//  Created by Tomáš Brand on 19.11.2023.
//

@testable import RocketsToolkit
import NetworkProvider
import NetworkProviderMocks
import SharedDomain
import SharedDomainMocks
import Utilities
import XCTest

final class RocketsRepositoryTests: XCTestCase {
    
    // MARK: Dependencies
    
    private let networkProvider = NetworkProviderMocks()
    
    private func createRepository() -> RocketsRepository {
        RocketsRepositoryImpl(networkProvider: networkProvider)
    }
    
    // MARK: Tests
    
    func testRead() async throws {
        let repository = createRepository()
        networkProvider.requestReturnData = NETRocket.stub(in: Bundle(for: type(of: self)))
        
        let rocket = try await repository.read(id: Rocket.stub.id)
        
        XCTAssertEqual(rocket, .stub)
        XCTAssertEqual(networkProvider.requestCallsCount, 1)
    }
}
