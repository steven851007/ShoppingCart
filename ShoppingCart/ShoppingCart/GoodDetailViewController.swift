//
//  GoodDetailViewController.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import UIKit

class GoodDetailViewController: UIViewController {

    var goodViewModel: GoodDetailsViewModel!
    var shoppingCart: ShoppingCart!
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    private let shoppingCartSegueId = "shoppingCart"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(image: UIImage(named: "ShoppingBag"), style: .plain, target: self, action: #selector(showShoppingCart(_:)))
        navigationItem.rightBarButtonItem = addButton
        configureView()
    }
    
    func configureView() {
        guard self.goodViewModel != nil else {
            fatalError("Good has to be set before configuring the view")
        }
        self.title = self.goodViewModel.screenTitle
        self.titleLabel.text = self.goodViewModel.descriptionTitle
        self.descriptionLabel.text = self.goodViewModel.detailedDescription
    }

    func showShoppingCart(_ sender: Any) {
        self.performSegue(withIdentifier: self.shoppingCartSegueId, sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.shoppingCartSegueId {
            guard let controller = segue.destination as? ShoppingCartTableViewController else {
                assert(true, "Wrong destination view controller in segue shoppingCart")
                return
            }
            controller.shoppingCart = self.shoppingCart
        }
    }
    
    @IBAction func addToCartButtonTapped(_ sender: Any) {
        self.shoppingCart.add(good: self.goodViewModel.good)
    }
    
}

