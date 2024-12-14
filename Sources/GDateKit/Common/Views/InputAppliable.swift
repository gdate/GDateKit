//
//  InputAppliable.swift
//  GDateKit
//
//  Created by teda on 2024/12/13.
//

public protocol InputAppliable {
    associatedtype Input: Hashable
    func apply(input: Input)
}
