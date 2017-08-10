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
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    static func formattedStringCurrency(value: NSDecimalNumber) -> String {
        self.numberFormatter.currencyCode = Currencies.selectedCurrency.code
        guard let formattedNumber = self.numberFormatter.string(from: value) else {
            assert(true, "Cannot format value")
            return ""
        }
        return formattedNumber
    }
    
}
