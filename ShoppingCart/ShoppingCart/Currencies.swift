//
//  Currencies.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import Foundation

class Currencies {
    
    private(set) static var selectedCurrency = Currency(code: "USD", name: "United States Dollar", exchangeRate: 1) {
        didSet {
            guard selectedCurrency.exchangeRate != nil else {
                fatalError("Only currencies with exchange rates should be selected")
            }
        }
    }
    private(set) static var currencies = [Currency(code: "USD", name: "United States Dollar", exchangeRate: 1)]
    
    static func downloadCurrencies() {
        let currencyDownloader = CurrencyDownloader()
        currencyDownloader.downloadCurrencies { (currencies, error) in
            if let currencies = currencies {
                self.currencies = currencies.sorted { $0.name < $1.name }
            } else if let error = error {
                print(error.localizedDescription)
            } else {
                assert(true, "Something really went wrong")
            }
        }
    }
    
    static func changeCurrency(to currency: Currency, completion: @escaping (Bool) -> Void) {
        if currency.exchangeRate != nil {
            self.selectedCurrency = currency
            completion(true)
            return
        }
        
        let currencyDownloader = CurrencyDownloader()
        currencyDownloader.downloadExchangeRate(for: currency) { (exchangeRate, error) in
            if let exchangeRate = exchangeRate {
                if let index = currencies.index(of: currency) {
                    self.selectedCurrency = Currency(code: currency.code, name: currency.name, exchangeRate: exchangeRate)
                    currencies[index] = self.selectedCurrency
                    completion(true)
                    return
                } else {
                    assert(true, "Currency should be in the currencies array")
                }
            } else if let error = error {
                print(error.localizedDescription)
            } else {
                assert(true, "Something really went wrong")
            }
            completion(false)
        }
    }
}

