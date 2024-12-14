//
//  ExampleCell.swift
//  GDateKitExample
//
//  Created by teda on 2024/12/13.
//

import GDateKit
import SwiftUI
import UIKit

final class ExampleCell: UICollectionViewCell {
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

private extension ExampleCell {
    func setupView() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

extension ExampleCell: InputAppliable {
    struct Input: Hashable {
        let titleText: String
    }
    
    func apply(input: Input) {
        titleLabel.text = input.titleText
    }
}

@available(iOS 17.0, *)
#Preview(traits: .sizeThatFitsLayout) {
    let items = [
        ExampleCell.Input(titleText: "Hello, World!"),
        ExampleCell.Input(titleText: "Hello, World!"),
    ]
    let layoutProvider = { () -> UICollectionViewCompositionalLayout in
        UICollectionViewCompositionalLayout { _, _ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(20))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitems: [item])
            return NSCollectionLayoutSection(group: group)
        }
    }
    UICollectionViewPreview(
        items: items,
        cellProvider: { ExampleCell() },
        layoutProvider: layoutProvider) { cell, input in
            cell.apply(input: input)
        }
}
