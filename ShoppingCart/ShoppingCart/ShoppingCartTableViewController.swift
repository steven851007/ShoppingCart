//
//  ShoppingCartTableViewController.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import UIKit

class ShoppingCartTableViewController: UITableViewController {

    var shoppingCart: ShoppingCart!
    
    private let showCurrencySelectorSegueId = "showCurrencySelector"
    private var selectedCurrency = Currencies.selectedCurrency
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        let settingsButton = UIBarButtonItem(title: "\u{2699}", style: .plain, target: self, action: #selector(showCurrencySelector(_:)))
        navigationItem.rightBarButtonItem = settingsButton
        self.updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.selectedCurrency != Currencies.selectedCurrency {
            self.selectedCurrency = Currencies.selectedCurrency
            self.updateView()
        }
    }
    
    private func updateView() {
        let price = self.shoppingCart.totalPrice.multiplying(by: Currencies.selectedExchangeRate)
        self.title = CurrencyFormatter.formattedPrice(price: price, to: Currencies.selectedCurrency)
        self.tableView.reloadRows(at: self.tableView.indexPathsForVisibleRows ?? [], with: .automatic)
    }
    
    // MARK: - Navigation
    
    func showCurrencySelector(_ sender: Any) {
        self.performSegue(withIdentifier: self.showCurrencySelectorSegueId, sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.showCurrencySelectorSegueId {
                let controller = (segue.destination as! UINavigationController).topViewController as! CurrencySelectorTableViewController
            controller.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(dismiss(_:)))
        }
    }

    func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shoppingCart.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoodCell", for: indexPath)

        let shoppingCartItem = ShoppingCartItemCellViewModel(shoppingCartItem: self.shoppingCart[indexPath.row])
        cell.textLabel?.text = shoppingCartItem.title
        cell.detailTextLabel?.text = shoppingCartItem.totalPrice
        return cell

    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.shoppingCart.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.updateView()
        }
    }

}
