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

class Good {
    
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

class GoodDetailsViewModel {
    let good: Good
    
    init(good: Good) {
        self.good = good
    }
    
    var title: String {
       return self.good.name + " ($ " + self.good.price.stringValue + " per " + self.good.unit.rawValue + ")"
    }
    
    var detailedDescription: String {
        return "Here we can return some extra information about the product that will be displayed on the product details screen"
    }
}

class GoodCellViewModel {
    
    let good: Good
    
    init(good: Good) {
        self.good = good
    }
    
    var name: String {
        return self.good.name
    }
    
    var pricePerUnit: String {
        return "$ " + self.good.price.stringValue + " per " + self.good.unit.rawValue
    }
}
