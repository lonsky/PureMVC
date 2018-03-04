//
//  DetailsFlowViewController.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 02/03/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class DetailsFlowViewController: UIViewController {

    private let indexPath: IndexPath
    private let session: Session
    
    init(with indexPath: IndexPath, session: Session) {
        self.indexPath = indexPath
        self.session = session
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let detailsViewController = ViewControllersFactory.detailsViewController
        let viewModel = DetailsViewModel(self.indexPath)
        viewModel.onSettingsHandler = { [weak self] in
            self?.runSettingsFlow()
        }
        detailsViewController.viewModel = viewModel
        self.embed(detailsViewController)
        
        // TODO:
        self.navigationItem.title = detailsViewController.navigationItem.title
    }
    
    private func runSettingsFlow() {
        let settingsFlow = SettingsFlowViewController(with: .details)
        settingsFlow.onSignOutDidPress = { [weak self] in
            self?.session.state = .signedOut
        }
        self.navigationController?.pushViewController(settingsFlow, animated: true)
    }
}
