//
//  SettingsFlowViewController.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 01/03/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class SettingsFlowViewController: UIViewController {
    
    private let presentationMode: PresentationMode
    
    var onDoneDidPress: (() -> Void)?
    var onSignOutDidPress: (() -> Void)?

    init(with presentationMode: PresentationMode) {
        self.presentationMode = presentationMode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let settingsViewModel = SettingsViewModel()
        settingsViewModel.onDoneHandler = self.onDoneDidPress
        settingsViewModel.onSignOutHandler = self.onSignOutDidPress
        let settings = ViewControllersFactory.settingsViewController
        settings.viewModel = settingsViewModel
        
        if self.presentationMode == .modal {
            let navigationController = UINavigationController(rootViewController: settings)
            self.embed(navigationController)
        } else {
            self.embed(settings)
            
            // TODO:
            self.navigationItem.title = settings.navigationItem.title
        }
    }
}
