//
//  HighlightingView.swift
//  Recipes
//
//  Created by Александра Башкирова on 08/03/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

protocol HighlightingView {
    func highlight(view: UIView, duration: TimeInterval, scale: CGFloat)
    func unhighlight(view: UIView, duration: TimeInterval)
}

extension HighlightingView {
    func highlight(view: UIView, duration: TimeInterval = 0.25, scale: CGFloat = 0.95) {
        UIView.animate(withDuration: duration) {
            view.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
    
    func unhighlight(view: UIView, duration: TimeInterval = 0.25) {
        UIView.animate(withDuration: duration) {
            view.transform = .identity
        }
    }
}
