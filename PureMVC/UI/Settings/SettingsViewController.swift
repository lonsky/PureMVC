//
//  SettingsViewController.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 27/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var viewModel: SettingsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.viewModel.title
    }
    
    @IBAction func onDoneDidPress(_ sender: Any) {
        self.viewModel.onDoneHandler?()
    }
    
    @IBAction func onSignOutDidPress(_ sender: Any) {
        self.viewModel.onSignOutHandler?()
    }
}
