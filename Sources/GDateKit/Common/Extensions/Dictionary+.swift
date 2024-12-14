//
//  Dictionary+.swift
//  GDateKit
//
//  Created by teda on 2024/12/12.
//

import Foundation

public extension Dictionary {
    var queryItems: [URLQueryItem] {
        var output: [URLQueryItem] = []
        for (key, value) in self {
            guard let keyString = key as? String, let valueString = value as? String else { return [] }
            output.append(URLQueryItem(name: keyString, value: valueString))
        }
        return output
    }
}
