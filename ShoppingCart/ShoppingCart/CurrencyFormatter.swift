//
//  CurrencyFormatter.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import Foundation

class CurrencyFormatter {
    
    static let numberFormatter: NumberFormatter = {
        // Static formatter to avoid performance issues
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    static func formattedPrice(price: NSDecimalNumber, to currency: Currency) -> String {
        self.numberFormatter.currencyCode = currency.code
        guard let formattedNumber = self.numberFormatter.string(from: price) else {
            assert(true, "Cannot format value")
            return ""
        }
        return formattedNumber
    }
    
}
