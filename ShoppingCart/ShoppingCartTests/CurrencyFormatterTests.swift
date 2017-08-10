//
//  CurrencyFormatterTests.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import XCTest
@testable import ShoppingCart

class CurrencyFormatterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFormatter() {
        let currency = Currency(code: "USD", name: "Americna dollar", exchangeRate: nil)
        XCTAssertEqual(CurrencyFormatter.formattedPrice(price: NSDecimalNumber(value: 1), to: currency), "$1.00")
        let currency1 = Currency(code: "HUF", name: "Hungarian Forint", exchangeRate: nil)
        XCTAssertEqual(CurrencyFormatter.formattedPrice(price: NSDecimalNumber(value: 1), to: currency1), "HUF1.00")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
