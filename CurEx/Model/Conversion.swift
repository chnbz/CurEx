//
//  Conversion.swift
//  CurEx
//
//  Created by Cihan on 06.04.21.
//  Copyright © 2021 Boz Apps. All rights reserved.
//

import SwiftUI

struct Conversion: Decodable, Equatable {

    var base: String
    var date: String
    var rates: [String: Double]
    
    static func == (lhs: Conversion, rhs: Conversion) -> Bool {
        return lhs.base == rhs.base &&
            lhs.date == rhs.date &&
            lhs.rates == rhs.rates
    }
}

