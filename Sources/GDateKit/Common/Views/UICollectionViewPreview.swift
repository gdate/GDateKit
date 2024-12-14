//
//  UICollectionViewPreview.swift
//  GDateKit
//
//  Created by teda on 2024/12/12.
//

import SwiftUI
import UIKit

public struct UICollectionViewPreview<ItemType: Hashable, CellType: UICollectionViewCell>: UIViewRepresentable {
    public typealias CellConfigurator = (CellType, ItemType) -> Void
    
    let items: [ItemType]
    let cellProvider: () -> CellType
    let layoutProvider: () -> UICollectionViewCompositionalLayout
    let cellConfigurator: CellConfigurator
    var backgroundColor: UIColor = .white
    
    public init(
        items: [ItemType],
        cellProvider: @escaping () -> CellType,
        layoutProvider: @escaping () -> UICollectionViewCompositionalLayout,
        cellConfigurator: @escaping CellConfigurator
    ) {
        self.items = items
        self.cellProvider = cellProvider
        self.layoutProvider = layoutProvider
        self.cellConfigurator = cellConfigurator
    }
    
    public func makeUIView(context: Context) -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutProvider())
        collectionView.dataSource = context.coordinator
        collectionView.register(CellType.self, useNib: false)
        collectionView.backgroundColor = backgroundColor
        return collectionView
    }
    
    public func updateUIView(_ uiView: UICollectionView, context: Context) {}
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, items: items)
    }
    
    public class Coordinator: NSObject, UICollectionViewDataSource {
        private let parent: UICollectionViewPreview
        private let items: [ItemType]
        
        init(parent: UICollectionViewPreview, items: [ItemType]) {
            self.parent = parent
            self.items = items
        }
        
        public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            items.count
        }
        
        public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(with: CellType.self, for: indexPath)
            parent.cellConfigurator(cell, items[indexPath.item])
            return cell
        }
    }
}
