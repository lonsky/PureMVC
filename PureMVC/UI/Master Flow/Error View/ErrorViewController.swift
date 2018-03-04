//
//  ErrorViewController.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 04/03/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {

    var viewModel: ErrorViewModel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = self.viewModel.title
        self.detailsLabel.text = self.viewModel.details
    }
    
    @IBAction func onRetryDidPress(_ sender: Any) {
        self.viewModel.onRetryDidPress?();
    }
}
