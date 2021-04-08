//
//  Currency.swift
//  CurEx
//
//  Created by Cihan on 04.04.21.
//  Copyright © 2021 Boz Apps. All rights reserved.
//

import SwiftUI

struct Currency: Identifiable {
    var id = UUID().uuidString
    var currencyName: String
    var currencyValue: Double
}
