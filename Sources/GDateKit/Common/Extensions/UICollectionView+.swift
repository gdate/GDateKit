//
//  UICollectionView+.swift
//  GDateKit
//
//  Created by teda on 2024/12/12.
//

import UIKit

public extension UICollectionView {
    func register<T: UICollectionViewCell>(_ cellType: T.Type, useNib: Bool = true) {
        let className = String(describing: cellType)
        if useNib {
            let nib = UINib(nibName: className, bundle: Bundle(for: T.self))
            register(nib, forCellWithReuseIdentifier: className)
        } else {
            register(cellType, forCellWithReuseIdentifier: className)
        }
    }
    
    func register<T: UICollectionReusableView>(_ viewType: T.Type, forSupplementaryViewOfKind elementKind: String, useNib: Bool = true) {
        let className = String(describing: viewType)
        if useNib {
            let nib = UINib(nibName: className, bundle: Bundle(for: T.self))
            register(nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: className)
        } else {
            register(viewType, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: className)
        }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath) as? T ?? T()
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(with type: T.Type, ofKind elementKind: String, for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: String(describing: type), for: indexPath) as? T ?? T()
    }
}
