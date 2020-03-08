//
//  StepJSON.swift
//  recipe
//
//  Created by Александра Башкирова on 02/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import Foundation

struct StepJSON: Codable {
    let number: String
    let description: String?
    let imageStep: String?
    
    func toPlain() -> Step {
        return Step(number: number, description: description, image: imageStep)
    }
}
