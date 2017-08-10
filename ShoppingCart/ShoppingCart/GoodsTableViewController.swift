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
    var objects = [Any]()
    var goods = [Good]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        goods = [Good(name: "Peas", price: NSDecimalNumber(decimal: 0.95), unit: .bag),
                 Good(name: "Eggs", price: NSDecimalNumber(decimal: 2.1), unit: .dozen),
                 Good(name: "Milk", price: NSDecimalNumber(decimal: 1.30), unit: .bottle),
                 Good(name: "Beans", price: NSDecimalNumber(decimal: 0.73), unit: .can)
                ]
        
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            goodDetailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? GoodDetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let good = self.goods[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! GoodDetailViewController
                controller.good = GoodDetailsViewModel(good: good)
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
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
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            goods.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}
