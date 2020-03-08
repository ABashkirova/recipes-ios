//
//  Array+Element.swift
//  Recipes
//
//  Created by Chernousov Alexander on 28/07/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

extension Array {
    func elementOrNil(index: Int) -> Element? {
        guard indices.contains(index) else {
            return nil
        }
        
        return self[index]
    }
}
