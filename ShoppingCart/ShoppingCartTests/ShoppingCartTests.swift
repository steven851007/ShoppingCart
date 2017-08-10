//
//  ShoppingCartTests.swift
//  ShoppingCartTests
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import XCTest
@testable import ShoppingCart

class ShoppingCartTests: XCTestCase {
    
    var shoppingCart: ShoppingCart!
    
    override func setUp() {
        super.setUp()
        self.shoppingCart = ShoppingCart()
    }
    
    override func tearDown() {
        self.shoppingCart = nil
        super.tearDown()
    }
    
    func testIsEmpty() {
        XCTAssertTrue(self.shoppingCart.isEmpty)
        let good = Good(name: "Test", price: NSDecimalNumber(value: 1), unit: .bag)
        self.shoppingCart.add(good: good)
        XCTAssertFalse(self.shoppingCart.isEmpty)
    }
    
    func testCount() {
        XCTAssertEqual(self.shoppingCart.count, 0)
        let good = Good(name: "Test", price: NSDecimalNumber(value: 1), unit: .bag)
        self.shoppingCart.add(good: good)
        XCTAssertEqual(self.shoppingCart.count, 1)
        self.shoppingCart.add(good: good)
        XCTAssertEqual(self.shoppingCart.count, 1)
        XCTAssertEqual(self.shoppingCart[0].count, 2)
    }
    
    func testAdd() {
        let good = Good(name: "Test", price: NSDecimalNumber(value: 1), unit: .bag)
        self.shoppingCart.add(good: good)
        XCTAssertEqual(self.shoppingCart.count, 1)
        XCTAssertEqual(self.shoppingCart[0].good, good)
    }
    
    func testRemove() {
        let good = Good(name: "Test", price: NSDecimalNumber(value: 1), unit: .bag)
        self.shoppingCart.add(good: good)
        self.shoppingCart.remove(good: good)
        XCTAssertEqual(self.shoppingCart.count, 0)
        self.shoppingCart.add(good: good)
        self.shoppingCart.remove(at: 0)
        XCTAssertEqual(self.shoppingCart.count, 0)
    }
    
    func testTotalPrice() {
        XCTAssertEqual(self.shoppingCart.totalPrice, NSDecimalNumber(value: 0))
        let good = Good(name: "Test", price: NSDecimalNumber(value: 1), unit: .bag)
        self.shoppingCart.add(good: good)
        XCTAssertEqual(self.shoppingCart.totalPrice, NSDecimalNumber(value: 1))
        self.shoppingCart.add(good: good)
        XCTAssertEqual(self.shoppingCart.totalPrice, NSDecimalNumber(value: 2))
        let good1 = Good(name: "Test1", price: NSDecimalNumber(value: 11), unit: .bag)
        self.shoppingCart.add(good: good1)
        XCTAssertEqual(self.shoppingCart.totalPrice, NSDecimalNumber(value: 13))
    }
    
    
}
