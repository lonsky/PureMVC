//
//  DetailsViewController.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 26/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var viewModel: DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.viewModel.title
    }

    @IBAction func onSettingsDidPress(_ sender: Any) {
        self.viewModel.onSettingsHandler?()
    }
}
