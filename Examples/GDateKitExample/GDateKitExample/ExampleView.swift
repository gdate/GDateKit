//
//  ExampleView.swift
//  GDateKitExample
//
//  Created by teda on 2024/12/13.
//

import GDateKit
import SwiftUI
import UIKit

final class ExampleView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ExampleView {
    func setupView() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

extension ExampleView: InputAppliable {
    struct Input: Hashable {
        let titleText: String
    }
    
    func apply(input: Input) {
        titleLabel.text = input.titleText
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    UIViewPreview {
        let view = ExampleView()
        view.apply(input: ExampleView.Input(titleText: "Hello, World!"))
        return view
    }
}
