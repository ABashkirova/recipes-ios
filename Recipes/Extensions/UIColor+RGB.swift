//
//  UIColor+RGB.swift
//  Recipes
//
//  Created by Александра Башкирова on 03/02/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        let newRed = CGFloat(red) / 255
        let newGreen = CGFloat(green) / 255
        let newBlue = CGFloat(blue) / 255
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: alpha)
    }
}
