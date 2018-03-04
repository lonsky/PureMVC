//
//  SignInViewModel.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 27/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import Foundation

class SignInViewModel {
    
    var onSignIn: (() -> Void)?
    
    var title: String {
        return "Sign In"
    }
}
