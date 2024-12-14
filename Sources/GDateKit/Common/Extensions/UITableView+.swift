//
//  UITableView+.swift
//  GDateKit
//
//  Created by teda on 2024/12/12.
//

import UIKit

public extension UITableView {
    func registerCell<T: UITableViewCell>(type: T.Type) {
        let className = String(describing: type)
        let nib = UINib(nibName: className, bundle: Bundle(for: T.self))
        register(nib, forCellReuseIdentifier: className)
    }
    
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(type: T.Type) {
        let className = String(describing: type)
        let nib = UINib(nibName: className, bundle: Bundle(for: T.self))
        register(nib, forHeaderFooterViewReuseIdentifier: className)
    }
    
    func dequeueCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath) as? T ?? T()
    }
    
    func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>(type: T.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: String(describing: type)) as? T ?? T()
    }
    
    func reloadData(with completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.0) { [weak self] in
            self?.reloadData()
        } completion: { _ in
            completion?()
        }
    }
}
