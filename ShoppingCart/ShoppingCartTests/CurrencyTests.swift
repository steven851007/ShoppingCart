//
//  CurrencyTests.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import XCTest
@testable import ShoppingCart

class CurrencyTests: XCTestCase {
    
    func testCurrenciesEqual() {
        let currency1 = Currency(code: "HUF", name: "Hungarian Forint", exchangeRate: nil)
        let currency2 = Currency(code: "HUF", name: "Hungarian dollar", exchangeRate: NSDecimalNumber(value: 1))
        let currency3 = Currency(code: "USD", name: "Hungarian Forint", exchangeRate: nil)
        XCTAssertEqual(currency1, currency2)
        XCTAssertNotEqual(currency2, currency3)
    }
    
}
