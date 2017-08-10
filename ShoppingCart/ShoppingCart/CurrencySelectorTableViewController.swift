//
//  CurrencySelectorTableViewController.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import UIKit

class CurrencySelectorTableViewController: UITableViewController {

    var currencies = [Currency]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currencies = Currencies.currencies
        self.title = "Choose currency"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currencies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath)

        cell.accessoryType = .none
        let currency = self.currencies[indexPath.row]
        cell.textLabel?.text = currency.name
        if self.currencies[indexPath.row] == Currencies.selectedCurrency {
            cell.accessoryType = .checkmark
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicatorView.color = .black
        activityIndicatorView.startAnimating()
        self.navigationItem.titleView = activityIndicatorView
        self.view.isUserInteractionEnabled = false
        Currencies.changeCurrency(to: self.currencies[indexPath.row]) { (successfull) in
            if successfull {
               self.dismiss(animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Error", message: "Couldn't fetch exchange rate, please try again later.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            self.navigationItem.titleView = nil
            self.view.isUserInteractionEnabled = true
        }
        
    }
}