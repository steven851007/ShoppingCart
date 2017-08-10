//
//  ShoppingCartItemCellViewModel.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import Foundation

class ShoppingCartItemCellViewModel {
    
    let shoppingCartItem: ShoppingCartItem
    
    init(shoppingCartItem: ShoppingCartItem) {
        self.shoppingCartItem = shoppingCartItem
    }
    
    var title: String {
        return self.shoppingCartItem.good.name + " " + String(self.shoppingCartItem.count) + "x"
    }
    
    var totalPrice: String {
        let price = self.shoppingCartItem.totalPrice.multiplying(by: Currencies.selectedExchangeRate)
        let formattedPrice =  CurrencyFormatter.formattedPrice(price: price, to: Currencies.selectedCurrency) 
        return "Total: \(formattedPrice)"
    }
}
