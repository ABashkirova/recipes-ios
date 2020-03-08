//
//  CellPresenter.swift
//  ramba-tests
//
//  Created by Chernousov Alexander on 02/01/2019.
//  Copyright © 2019 Chernousov Alexander. All rights reserved.
//

import Foundation
import Reusable

protocol CellPresenter {
    var reusableClass: Reusable.Type { get }
}
