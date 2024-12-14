//
//  NSObject+.swift
//  GDateKit
//
//  Created by teda on 2024/12/12.
//

import Foundation

public extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
