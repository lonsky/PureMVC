//
//  AppFlowViewController.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 26/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class AppFlowViewController: UIViewController {

    private let session = Session()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.session.onStateDidChange = { [weak self] _ in
            self?.dispatchUI()
        }
        self.dispatchUI()
    }
    
    private func dispatchUI() {
        switch self.session.state {
        case .signedOut:
            self.showSignInView()
            
        case .signedIn:
            self.runMasterFlow()
        }
    }
    
    private func runMasterFlow() {
        let master = MasterFlowViewController(self.session)
        self.transition(to: master)
    }
    
    private func showSignInView() {
        let signIn = ViewControllersFactory.signInViewController
        let viewModel = SignInViewModel()
        viewModel.onSignIn = { [weak self] in
            self?.session.state = .signedIn
        }
        signIn.viewModel = viewModel
        self.transition(to: signIn)
    }
}

