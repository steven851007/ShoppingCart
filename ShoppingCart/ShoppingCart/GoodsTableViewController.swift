//
//  GoodsTableViewController.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import UIKit

class GoodsTableViewController: UITableViewController {

    var goodDetailViewController: GoodDetailViewController? = nil
    var goods = [Good]()
    let shoppingCart = ShoppingCart()
    private var selectedCurrency = Currencies.selectedCurrency

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Goods"
        goods = [Good(name: "Peas", price: NSDecimalNumber(decimal: 0.95), unit: .bag),
                 Good(name: "Eggs", price: NSDecimalNumber(decimal: 2.1), unit: .dozen),
                 Good(name: "Milk", price: NSDecimalNumber(decimal: 1.30), unit: .bottle),
                 Good(name: "Beans", price: NSDecimalNumber(decimal: 0.73), unit: .can)
                ]
        
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(image: UIImage(named: "ShoppingBag"), style: .plain, target: self, action: #selector(showShoppingCart(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            goodDetailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? GoodDetailViewController
        }
    }
    
    private func updateView() {
        self.tableView.reloadRows(at: self.tableView.indexPathsForVisibleRows ?? [], with: .automatic)
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        if self.selectedCurrency != Currencies.selectedCurrency {
            self.selectedCurrency = Currencies.selectedCurrency
            self.updateView()
        }
    }

    func showShoppingCart(_ sender: Any) {
        self.performSegue(withIdentifier: "shoppingCart", sender: sender)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let good = self.goods[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! GoodDetailViewController
                controller.goodViewModel = GoodDetailsViewModel(good: good)
                controller.shoppingCart = self.shoppingCart
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        } else if segue.identifier == "shoppingCart" {
            let controller = segue.destination as! ShoppingCartTableViewController
            controller.shoppingCart = self.shoppingCart
        }
    }

    // MARK: - Table View

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.goods.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let good = GoodCellViewModel(good: self.goods[indexPath.row])
        cell.textLabel?.text = good.name
        cell.detailTextLabel?.text = good.pricePerUnit
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            goods.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


}

