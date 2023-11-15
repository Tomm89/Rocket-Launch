//
//  RocketsViewModelTests.swift
//  RocketLaunchTests
//
//  Created by Tomáš Brand on 19.11.2023.
//

@testable import Rockets
import Resolver
import SharedDomain
import SharedDomainMocks
import UIToolkit
import XCTest

@MainActor
final class RocketsViewModelTests: XCTestCase {
    
    // MARK: - Dependencies
    
    private let fc = FlowControllerMock<RocketsFlow>(navigationController: UINavigationController())
    private let getRocketsUseCaseMock = GetRocketsUseCaseMock()
    
    private func createViewModel() -> RocketsViewModel {
        Resolver.register { self.getRocketsUseCaseMock as GetRocketsUseCase }
        let vm = RocketsViewModel(flowController: fc)
        return vm
    }
    
    // MARK: - Tests
    
    func testOnAppear() async {
        // given
        getRocketsUseCaseMock.executePageReturnValue = [Rocket].stub
        
        // when
        let vm = createViewModel()
        vm.onAppear()
        await vm.awaitAllTasks()
        
        // then
        XCTAssertEqual(vm.state.rockets, [Rocket].stub)
        XCTAssertEqual(vm.state.isLoading, false)
    }
    
    func testShowRocketDetail() async {
        // given
        let rocket = Rocket.stub
        
        // when
        let vm = createViewModel()
        vm.onIntent(.showDetail(rocket.id))
        await vm.awaitAllTasks()
        
        // then
        XCTAssertEqual(fc.handleFlowValue, .rockets(.showRocketDetail(rocket.id)))
    }
}
