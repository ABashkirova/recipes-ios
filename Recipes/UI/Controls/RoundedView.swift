//
//  RoundedView.swift
//  recipe
//
//  Created by Александра Башкирова on 02/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedView: UIView {
    
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
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            updateLayer()
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            updateLayer()
        }
    }
    
    private var borderLayer: CAShapeLayer? = nil
    
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
        
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: usedCorners,
            cornerRadii: CGSize(
                width: cornerRadius,
                height: cornerRadius
            )
        )
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
        
        if borderLayer == nil {
            borderLayer = CAShapeLayer()
            layer.addSublayer(borderLayer!)
        }
        
        borderLayer?.path = maskLayer.path
        borderLayer?.strokeColor = borderColor.cgColor
        borderLayer?.fillColor = UIColor.clear.cgColor
        borderLayer?.lineWidth = borderWidth
        borderLayer?.frame = bounds
    }
}
