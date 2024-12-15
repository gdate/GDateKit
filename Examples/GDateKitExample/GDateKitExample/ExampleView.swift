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
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .darkGray
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
        addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
        ])
    }
}

extension ExampleView: InputAppliable {
    struct Input: Hashable {
        let titleText: String
        let subtitleText: String
    }

    func apply(input: Input) {
        titleLabel.text = input.titleText
        subtitleLabel.text = input.subtitleText
    }
}

#Preview("Default", traits: .sizeThatFitsLayout) {
    UIViewPreview {
        let view = ExampleView()
        view.apply(input: ExampleView.Input(
            titleText: "Hello, World!",
            subtitleText: "Welcome to the preview"
        ))
        return view
    }
}
