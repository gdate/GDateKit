//
//  Instantiatable.swift
//  GDateKit
//
//  Created by teda on 2024/12/12.
//

import Foundation

public protocol Instantiatable: Injectable {
    static func instantiate(with dependency: Dependency) -> Self
}

public extension Instantiatable where Dependency == Void {
    static func instantiate() -> Self {
        return instantiate(with: ())
    }
}
