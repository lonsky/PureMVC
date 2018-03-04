//
//  ViewController.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 26/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class MainFlowViewController: UIViewController {

    private let session = Session()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.session.onStateDidChange = { [weak self] _ in
            self?.dispatchUI()
        }
        self.dispatchUI()
    }
    
    private func dispatchUI() {
        if session.state == .signedOut {
            self.runSignInFlow()
        } else {
            self.runMasterFlow()
        }
    }
    
    private func runMasterFlow() {
        let masterViewController = ViewControllersFactory.masterViewController
        let viewModel = MasterTableViewModel()
        viewModel.onSelectRow = { indexPath in
            let detailsFlow = DetailsFlowViewController(with: indexPath, session: self.session)
            masterViewController.navigationController?.pushViewController(detailsFlow, animated: true)
        }
        viewModel.onShowSettings = { [weak self] in
            self?.runSettingsFlow()
        }
        masterViewController.viewModel = viewModel
        let navigationController = UINavigationController(rootViewController: masterViewController)
        self.transition(to: navigationController)
    }
    
    private func runSignInFlow() {
        let signIn = ViewControllersFactory.signInViewController
        let viewModel = SignInViewModel()
        viewModel.onSignIn = { [weak self] in
            self?.session.state = .signedIn
        }
        signIn.viewModel = viewModel
        self.transition(to: signIn)
    }
    
    private func runSettingsFlow() {
        let settingsFlow = SettingsFlowViewController(with: .modal)
        settingsFlow.onDoneDidPress = { [weak self] in
            self?.dismiss(animated: true)
        }
        settingsFlow.onSignOutDidPress = { [weak self] in
            self?.session.state = .signedOut
            self?.dismiss(animated: true)
        }
        self.present(settingsFlow, animated: true)
    }
}

