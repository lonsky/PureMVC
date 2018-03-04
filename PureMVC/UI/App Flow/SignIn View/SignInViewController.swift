//
//  SignInViewController.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 27/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
 
    var viewModel: SignInViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.viewModel.title
    }
    
    @IBAction func onSignInDidPress(_ sender: Any) {
        self.viewModel.onSignIn?()
    }
}
