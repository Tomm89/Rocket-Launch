// Generated using Sourcery 2.0.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable all

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

import CoreLocation
import SharedDomain















public final class GetRocketUseCaseMock: GetRocketUseCase {

    public init() {}

    //MARK: - execute

    public var executeIdThrowableError: Error?
    public var executeIdCallsCount = 0
    public var executeIdCalled: Bool {
        return executeIdCallsCount > 0
    }
    public var executeIdReceivedId: String?
    public var executeIdReceivedInvocations: [String] = []
    public var executeIdReturnValue: Rocket!
    public init(executeIdReturnValue: Rocket) {
        self.executeIdReturnValue = executeIdReturnValue
    }
    public var executeIdClosure: ((String) async throws -> Rocket)?

    public func execute(id: String) async throws -> Rocket {
        executeIdCallsCount += 1
        executeIdReceivedId = id
        executeIdReceivedInvocations.append(id)
        if let error = executeIdThrowableError {
            throw error
        }
        if let executeIdClosure {
            return try await executeIdClosure(id)
        } else {
            return executeIdReturnValue
        }
    }

}
public final class GetRocketsUseCaseMock: GetRocketsUseCase {

    public init() {}

    //MARK: - execute

    public var executePageThrowableError: Error?
    public var executePageCallsCount = 0
    public var executePageCalled: Bool {
        return executePageCallsCount > 0
    }
    public var executePageReceivedPage: Int?
    public var executePageReceivedInvocations: [Int] = []
    public var executePageReturnValue: [Rocket]!
    public init(executePageReturnValue: [Rocket]) {
        self.executePageReturnValue = executePageReturnValue
    }
    public var executePageClosure: ((Int) async throws -> [Rocket])?

    public func execute(page: Int) async throws -> [Rocket] {
        executePageCallsCount += 1
        executePageReceivedPage = page
        executePageReceivedInvocations.append(page)
        if let error = executePageThrowableError {
            throw error
        }
        if let executePageClosure {
            return try await executePageClosure(page)
        } else {
            return executePageReturnValue
        }
    }

}
