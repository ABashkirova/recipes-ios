//
//  ShadowView.swift
//  recipe
//
//  Created by Александра Башкирова on 02/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            updateLayer()
        }
    }
    
    @IBInspectable var topRightCorner: Bool = false {
        didSet {
            updateLayer()
        }
    }
    
    @IBInspectable var topLeftCorner: Bool = false {
        didSet {
            updateLayer()
        }
    }
    
    @IBInspectable var bottomRightCorner: Bool = false {
        didSet {
            updateLayer()
        }
    }
    
    @IBInspectable var bottomLeftCorner: Bool = false {
        didSet {
            updateLayer()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 10 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    private var corners: [RectCorner: Bool] {
        return [
            .topRight: topRightCorner,
            .topLeft: topLeftCorner,
            .bottomRight: bottomRightCorner,
            .bottomLeft: bottomLeftCorner
        ]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateLayer()
    }
    
    private func updateLayer() {
        let usedCorners: UIRectCorner = UIRectCorner(
            corners.compactMap { $0.value ? $0.key.rectCorner : nil}
        )
        
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: usedCorners,
            cornerRadii: CGSize(
                width: cornerRadius,
                height: cornerRadius
            )
        ).cgPath
    }
}

