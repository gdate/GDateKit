//
//  Date+.swift
//  GDateKit
//
//  Created by teda on 2024/12/12.
//

import Foundation

public extension Date {
    func string(format: String, dateFormatter: DateFormatter = .shared) -> String {
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
