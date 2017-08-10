//
//  Good.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import Foundation

enum GoodUnit: String {
    case bag = "bag"
    case dozen = "dozen"
    case bottle = "bottle"
    case can = "can"
}

struct Good {

    let uuid = NSUUID()
    let name: String
    // Price / unit always in dollars ($).
    let price: NSDecimalNumber;
    let unit: GoodUnit
    
    init(name: String, price: NSDecimalNumber, unit: GoodUnit) {
        self.name = name
        self.price = price
        self.unit = unit
    }
}

extension Good: Equatable {

    static func ==(lhs: Good, rhs: Good) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

