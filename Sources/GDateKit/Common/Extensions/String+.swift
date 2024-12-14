//
//  String+.swift
//  GDateKit
//
//  Created by teda on 2024/12/12.
//

import Foundation

public extension String {
    func date(format: String, dateFormatter: DateFormatter = .shared) -> Date? {
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
