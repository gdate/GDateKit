//
//  ViewBindable.swift
//  GDateKit
//
//  Created by teda on 2024/12/14.
//

import UIKit

protocol ViewBindable where Self: UIViewController {}

extension ViewBindable {
    func bind(to viewController: UIViewController) {
        layout(to: viewController.view, of: viewController)
    }
    
    func bind(to targetView: UIView, of viewController: UIViewController) {
        layout(to: targetView, of: viewController)
    }
    
    func detach(targetView: UIView, from viewController: UIViewController) {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

private extension ViewBindable {
    func layout(to targetView: UIView, of viewController: UIViewController) {
        viewController.addChild(self)
        targetView.addSubview(view)
        didMove(toParent: viewController)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: targetView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: targetView.trailingAnchor),
            view.topAnchor.constraint(equalTo: targetView.topAnchor),
            view.bottomAnchor.constraint(equalTo: targetView.bottomAnchor)
        ])
    }
}
