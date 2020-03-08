//
//  RectCorner.swift
//  recipe
//
//  Created by Александра Башкирова on 02/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

enum RectCorner {
    case topRight
    case topLeft
    case bottomRight
    case bottomLeft
    
    var rectCorner: UIRectCorner {
        switch self {
        case .topRight: return .topRight
        case .topLeft: return .topLeft
        case .bottomRight: return .bottomRight
        case .bottomLeft: return .bottomLeft
        }
    }
}

