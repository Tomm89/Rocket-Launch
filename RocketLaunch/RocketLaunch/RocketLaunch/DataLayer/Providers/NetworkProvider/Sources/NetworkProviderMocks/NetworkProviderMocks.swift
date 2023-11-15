//
//  NetworkProviderMocks.swift
//  
//
//  Created by Tomáš Brand on 19.11.2023.
//

import Foundation
import NetworkProvider

public final class NetworkProviderMocks {
    
    public var requestCallsCount = 0
    public var requestReturnData: Data?
    public var requestReturnError: Error?

    private weak var _delegate: NetworkProviderDelegate?

    public init() {}
}

extension NetworkProviderMocks: NetworkProvider {
    
    public var delegate: NetworkProviderDelegate? {
        get {
            _delegate
        }
        set {
            _delegate = newValue
        }
    }
    
    public func request(_ endpoint: NetworkEndpoint, withInterceptor: Bool) async throws -> Data {
        requestCallsCount += 1
        if let error = requestReturnError {
            throw error
        } else if let data = requestReturnData {
            return data
        } else {
            throw NetworkProviderError.requestFailed(statusCode: .notFound, message: "")
        }
    }
}
