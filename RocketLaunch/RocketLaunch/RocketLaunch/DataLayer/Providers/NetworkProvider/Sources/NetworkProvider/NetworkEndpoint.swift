//
//  NetworkEndpoint.swift
//  
//
//  Created by Tomáš Brand on 11.03.2023.
//

import Foundation

public protocol NetworkEndpoint {

    /// The endpoint's base `URL`.
    var baseURL: URL { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: NetworkMethod { get }
    
    /// The headers to be used in the request.
    var headers: [String: String]? { get }
    
    /// The type of HTTP task to be performed.
    var task: NetworkTask { get }
}
