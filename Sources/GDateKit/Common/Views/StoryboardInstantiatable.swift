//
//  StoryboardInstantiatable.swift
//  GDateKit
//
//  Created by teda on 2024/12/12.
//

import UIKit

public enum StoryboardInstantiatableType {
    case initial
    case identifier(String)
}

public protocol StoryboardInstantiatable: Instantiatable {
    static var sourceStoryboard: UIStoryboard { get }
    static var instantiateType: StoryboardInstantiatableType { get }
}

public extension StoryboardInstantiatable where Self: NSObject {
    static var instantiateType: StoryboardInstantiatableType {
        return .identifier(className)
    }
}

@MainActor
public extension StoryboardInstantiatable where Self: UIViewController {
    static var sourceStoryboard: UIStoryboard {
        return UIStoryboard(name: className, bundle: Bundle(for: self))
    }
    
    static func instantiate(with dependency: Dependency) -> Self {
        let viewController: Self
        switch instantiateType {
        case .initial:
            viewController = sourceStoryboard.instantiateInitialViewController() as! Self
        case .identifier(let identifier):
            viewController = sourceStoryboard.instantiateViewController(withIdentifier: identifier) as! Self
        }
        
        viewController.inject(dependency)
        
        return viewController
    }
}
