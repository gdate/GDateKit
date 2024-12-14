//
//  IBInitializableView.swift
//  GDateKit
//
//  Created by teda on 2024/12/12.
//

import UIKit
import SwiftUI

public class IBInitializableView: UIView {
    var subView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
    
    private func loadNib() {
        guard let nibView = UINib(nibName: Self.className, bundle: .main).instantiate(withOwner: self).first as? UIView else {
            fatalError("\(Self.className) nib Setting is incorrect")
        }
        subView = nibView
        subView.frame = bounds
        addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subView.topAnchor.constraint(equalTo: topAnchor),
            subView.bottomAnchor.constraint(equalTo: bottomAnchor),
            subView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
