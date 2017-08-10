//
//  ShoppingCart.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import Foundation

class ShoppingCart {
    
    private var shoppingCartItems = [ShoppingCartItem]()
    private(set) var totalPrice: NSDecimalNumber = 0.0
    
    var count: Int {
        return self.shoppingCartItems.count
    }

    var isEmpty: Bool {
        return self.shoppingCartItems.isEmpty
    }
    
    func add(good: Good) {
        let shoppingCartItem = ShoppingCartItem(good: good)
        if let index = self.shoppingCartItems.index(of: shoppingCartItem) {
            self.shoppingCartItems[index].count += 1
        } else {
            self.shoppingCartItems.append(shoppingCartItem)
        }
        self.totalPrice = self.totalPrice.adding(good.price)
    }
    
    func remove(good: Good) {
        let shoppingCartItem = ShoppingCartItem(good: good)
        if let index = self.shoppingCartItems.index(of: shoppingCartItem) {
            self.shoppingCartItems.remove(at: index)
            self.totalPrice = self.totalPrice.subtracting(good.price)
        }
    }
    
    func remove(at index: Int) {
        guard index < self.shoppingCartItems.count else {
            return
        }
        self.totalPrice = self.totalPrice.subtracting(self.shoppingCartItems[index].totalPrice)
        self.shoppingCartItems.remove(at: index)
        
    }
    
    subscript(index: Int) -> ShoppingCartItem {
        return self.shoppingCartItems[index]
    }
    
}
