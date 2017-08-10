//
//  GoodDetailViewController.swift
//  ShoppingCart
//
//  Created by Istvan Balogh on 2017. 08. 10..
//  Copyright © 2017. Balogh István. All rights reserved.
//

import UIKit

class GoodDetailViewController: UIViewController {

    var good: GoodDetailsViewModel!
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        guard self.good != nil else {
            fatalError("Good has to be set before configuring the view")
        }
        self.titleLabel.text = self.good.title
        self.descriptionLabel.text = self.good.detailedDescription
    }

    


}

