//
//  ShoppingCartItem.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import Foundation

class ShoppingCartItem {
    
    let good: Good
    var count: Int
    var totalPrice: NSDecimalNumber {
        return self.good.price.multiplying(by: NSDecimalNumber(value: self.count))
    }
    
    init(good: Good) {
        self.good = good
        self.count = 1
    }
}

extension ShoppingCartItem: Equatable {
    
    public static func ==(lhs: ShoppingCartItem, rhs: ShoppingCartItem) -> Bool {
        return lhs.good.uuid == rhs.good.uuid
    }
}
