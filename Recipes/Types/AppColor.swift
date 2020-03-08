//
//  AppColor.swift
//  Recipes
//
//  Created by Александра Башкирова on 03/02/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

enum AppColor {
    
    static var colorCardBg: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "colorCardBg")!
        } else {
            return UIColor(red: 255, green: 255, blue: 255)
        }
    }
    
    static var colorMainBg: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "colorMainBg")!
        } else {
            return UIColor(red: 243, green: 227, blue: 188)
        }
    }
    
    static var colorMainTheme: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "colorMainTheme")!
        } else {
            return UIColor(red: 232, green: 178, blue: 70)
        }
    }
    
    static var colorTitle: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "colorTitle")!
        } else {
            return UIColor(red: 167, green: 4, blue: 2)
        }
    }
    
    static var colorText: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "colorText")!
        } else {
            return UIColor(red: 142, green: 142, blue: 142)
        }
    }
    
    static var colorSupportBg: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "colorSupportBg")!
        } else {
            return UIColor(red: 243, green: 234, blue: 198)
        }
    }
}
