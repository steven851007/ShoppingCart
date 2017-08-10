//
//  GoodCellViewModel.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import Foundation

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
