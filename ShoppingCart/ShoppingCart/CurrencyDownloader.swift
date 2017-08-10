//
//  CurrencyDownloader.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import Foundation

class CurrencyDownloader {
    
    private let accesKey = "0ce5f9e70a9fcf8769baf972dd258830"
    private let baseURL = URL(string :"http://apilayer.net/api/")
    
    func downloadCurrencies(completionHandler: @escaping ([Currency]?, Error?) -> Void) {
        guard let url = URL(string: "list?access_key=\(self.accesKey)", relativeTo: self.baseURL) else {
            completionHandler(nil, NSError(domain:"Wrong URL", code:-1, userInfo:nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            guard let data = data, error == nil else {
                completionHandler(nil, error)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let currenciesDict = json["currencies"] as? [String: String] {
                    var currencies = Currencies.currencies
                    for (currencyCode, currencyName) in currenciesDict {
                        let currency = Currency(code: currencyCode, name: currencyName, exchangeRate: nil)
                        if currencies.index(of: currency) == nil {
                            currencies.append(currency)
                        }
                    }
                    completionHandler(currencies, nil)
                }
            } catch {
                print("Error deserializing JSON: \(error)")
            }
        
        }
        
        task.resume()
    }
    
    func downloadExchangeRate(`for` currency: Currency, completionHandler: @escaping (NSDecimalNumber?, Error?) -> Void) {
        guard let url = URL(string: "live?access_key=\(self.accesKey)&currencies=\(currency.code)", relativeTo: self.baseURL) else {
            completionHandler(nil, NSError(domain:"Wrong URL", code:-1, userInfo:nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            guard let data = data, error == nil else {
                completionHandler(nil, error)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let exchangeRatesDict = json["quotes"] as? [String: Any],
                    let exchangeRate = exchangeRatesDict.values.first as? Double {
                    completionHandler(NSDecimalNumber(value: exchangeRate), nil)
                }
            } catch {
                print("Error deserializing JSON: \(error)")
                completionHandler(nil, error)
            }
            
        }
        
        task.resume()
    }

}
