//
//  Injectable.swift
//  GDateKit
//
//  Created by teda on 2024/12/12.
//

import Foundation

public protocol Injectable {
    associatedtype Dependency = Void
    func inject(_ value: Dependency)
}

public extension Injectable where Dependency == Void {
    func inject(_ value: Dependency) {}
}
