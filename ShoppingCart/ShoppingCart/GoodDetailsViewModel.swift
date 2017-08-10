//
//  GoodDetailsViewModel.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import Foundation

class GoodDetailsViewModel {
    let good: Good
    
    init(good: Good) {
        self.good = good
    }
    
    var screenTitle: String {
        return self.good.name
    }
    
    var descriptionTitle: String {
        return self.good.name + " ($ " + self.good.price.stringValue + " per " + self.good.unit.rawValue + ")"
    }
    
    var detailedDescription: String {
        return "Here we can return some extra information about the product that will be displayed on the product details screen"
    }
}
