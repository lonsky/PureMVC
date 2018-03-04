//
//  MasterViewModel.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 04/03/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class MasterViewModel: NSObject {

    enum State {
        case list
        case loading
        case error
    }
    
    private var state: State = .loading {
        didSet {
            self.onStateDidChange?(state)
        }
    }

    var onStateDidChange: ((_ state: State) -> Void)?
    var onShowSettings: (() -> Void)?
    
    var title: String {
        return "Master"
    }
    
    func loadContent() {
        self.state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.state = arc4random_uniform(2) == 0 ? .list : .error
        }
    }
}
