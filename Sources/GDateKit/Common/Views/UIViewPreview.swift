//
//  UIViewPreview.swift
//  GDateKit
//
//  Created by teda on 2024/12/12.
//

import SwiftUI
import UIKit

public struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View
    
    public init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    public func makeUIView(context: Context) -> UIView {
        view
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {}
}
