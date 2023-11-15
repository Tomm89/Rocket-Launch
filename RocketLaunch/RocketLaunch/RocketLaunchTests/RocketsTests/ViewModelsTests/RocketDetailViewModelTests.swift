//
//  RocketDetailViewModelTests.swift
//  RocketLaunchTests
//
//  Created by Tomáš Brand on 19.11.2023.
//

@testable import RocketDetail
import Resolver
import SharedDomain
import SharedDomainMocks
import UIToolkit
import XCTest

@MainActor
final class RocketDetailViewModelTests: XCTestCase {
    
    // MARK: - Dependencies
    
    private let fc = FlowControllerMock<RocketDetailFlow>(navigationController: UINavigationController())
    private let getRocketUseCaseMock = GetRocketUseCaseMock()
    
    private func createViewModel() -> RocketDetailViewModel {
        Resolver.register { self.getRocketUseCaseMock as GetRocketUseCase }
        let vm = RocketDetailViewModel(rocketId: Rocket.stub.id, flowController: fc)
        return vm
    }
    
    // MARK: - Tests
    
    func testOnAppear() async {
        // given
        let rocket = Rocket.stub
        getRocketUseCaseMock.executeIdReturnValue = rocket
        
        // when
        let vm = createViewModel()
        vm.onAppear()
        await vm.awaitAllTasks()
        
        // then
        XCTAssertEqual(vm.state.rocket, rocket)
        XCTAssertEqual(vm.state.isLoading, false)
    }
}
