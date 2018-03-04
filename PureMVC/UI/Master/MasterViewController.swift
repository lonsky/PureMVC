//
//  MasterViewController.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 04/03/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    var viewModel: MasterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.viewModel.title
    }

    @IBAction func onSettinsDidPress(_ sender: Any) {
        self.viewModel.onShowSettings?()
    }
}
