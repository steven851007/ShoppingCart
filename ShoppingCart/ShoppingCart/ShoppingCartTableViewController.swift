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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "$ " + self.shoppingCart.totalPrice.stringValue
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        let settingsButton = UIBarButtonItem(title: "\u{2699}", style: .plain, target: self, action: #selector(showCurrencySelector(_:)))
        navigationItem.rightBarButtonItem = settingsButton
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
            self.title = "$ " + self.shoppingCart.totalPrice.stringValue
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
