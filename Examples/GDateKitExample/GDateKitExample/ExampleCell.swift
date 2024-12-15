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
        label.textAlignment = .center
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
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 1
        
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
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
        ExampleCell.Input(titleText: "Short"),
        ExampleCell.Input(titleText: "This is a medium length text."),
        ExampleCell.Input(titleText: "Here is a longer text that you can use to see how it looks."),
    ]
    
    let layoutProvider: () -> UICollectionViewCompositionalLayout = {
        UICollectionViewCompositionalLayout { _, _ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(56), heightDimension: .absolute(37))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(56), heightDimension: .absolute(69))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 8
            section.orthogonalScrollingBehavior = .continuous
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
            return section
        }
    }
    UICollectionViewPreview(
        items: items,
        cellProvider: { ExampleCell() },
        layoutProvider: layoutProvider,
        cellConfigurator: { cell, input in
            cell.apply(input: input)
        }
    )
    .frame(height: 69)
}
