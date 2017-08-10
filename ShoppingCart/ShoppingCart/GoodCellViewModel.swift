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
        let price = self.good.price.multiplying(by: Currencies.selectedExchangeRate)
        let formattedPrice = CurrencyFormatter.formattedStringCurrency(value: price)
        return "\(formattedPrice) per \(self.good.unit.rawValue)"
    }
}
