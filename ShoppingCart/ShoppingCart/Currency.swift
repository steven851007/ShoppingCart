//
//  Currency.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import Foundation

struct Currency {
    let code: String
    let name: String
    let exchangeRate: NSDecimalNumber?
}

extension Currency: Equatable {
    
    static func ==(lhs: Currency, rhs: Currency) -> Bool {
        return lhs.code == rhs.code
    }
}

