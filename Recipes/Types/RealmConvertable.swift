//
//  RealmConvertable.swift
//  Recipes
//
//  Created by Александра Башкирова on 31/08/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

protocol RealmConvertable {
    associatedtype T
    func fromPlain(_ plain: T)
    func toPlain() -> T
}
