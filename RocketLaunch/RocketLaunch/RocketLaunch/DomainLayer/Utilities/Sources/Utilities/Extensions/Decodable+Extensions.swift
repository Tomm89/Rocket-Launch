//
//  Decodable+Extensions.swift
//  
//
//  Created by Tomáš Brand on 19.11.2023.
//

import Foundation

public extension Decodable {
    static func stub(in bundle: Bundle) -> Data {
        stub(for: bundle.url(forResource: String(describing: self), withExtension: "json"))
    }
    
    static func stubList(in bundle: Bundle) -> Data {
        stub(for: bundle.url(forResource: "\(String(describing: self))List", withExtension: "json"))
    }
    
    private static func stub(for url: URL?) -> Data {
        guard let url, let data = try? Data(contentsOf: url) else { return Data() }
        return data
    }
}
