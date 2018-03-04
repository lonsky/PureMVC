//
//  Session.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 27/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import Foundation

class Session {

    enum State {
        case signedIn
        case signedOut
    }

    var onStateDidChange: ((_ newState: State) -> Void)?
    
    var state: State = .signedOut {
        didSet {
            self.onStateDidChange?(state)
        }
    }
}
