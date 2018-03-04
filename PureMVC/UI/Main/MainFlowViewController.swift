//
//  ViewController.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 26/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class MainFlowViewController: UIViewController {

    private enum State {
        case signIn
        case list
        case loading
        case error
    }
    
    private let session = Session()
    private var state: State = .signIn {
        didSet {
            self.dispatchUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.session.onStateDidChange = { [weak self] newState in
            if newState == .signedIn {
                self?.state = .list
            } else {
                self?.state = .signIn
            }
        }
        self.dispatchUI()
    }
    
    private func dispatchUI() {
        switch self.state {
        case .signIn:
            self.showSignInView()
            
        case .list:
            self.showMasterView()

        case .loading:
            self.showActivityView()
            
        case .error:
            self.showErrorView()
        }
    }
    
    private func showMasterView() {
        let masterViewController = ViewControllersFactory.masterViewController
        let navigationController = UINavigationController(rootViewController: masterViewController)
        let viewModel = MasterTableViewModel()
        viewModel.onSelectRow = { [weak self] indexPath in
            self?.runDetailsFlow(for: indexPath, navigationController: navigationController)
        }
        viewModel.onShowSettings = { [weak self] in
            self?.runSettingsFlow()
        }
        masterViewController.viewModel = viewModel
        self.transition(to: navigationController)
    }
    
    private func showSignInView() {
        let signIn = ViewControllersFactory.signInViewController
        let viewModel = SignInViewModel()
        viewModel.onSignIn = { [weak self] in
            self?.state = .loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self?.session.state = .signedIn
            }
        }
        signIn.viewModel = viewModel
        self.transition(to: signIn)
    }
    
    private func showActivityView() {
        let activity = ViewControllersFactory.activityViewController
        self.transition(to: activity)
    }
    
    private func showErrorView() {
        // TODO:
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
    
    private func runDetailsFlow(for indexPath: IndexPath, navigationController: UINavigationController) {
        let detailsFlow = DetailsFlowViewController(with: indexPath, session: self.session)
        navigationController.pushViewController(detailsFlow, animated: true)
    }
}

