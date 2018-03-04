//
//  SettingsViewModel.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 27/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import Foundation

class SettingsViewModel {
 
    var onDoneHandler: (() -> Void)?
    var onSignOutHandler: (() -> Void)?
    
    var title: String {
        return "Settings"
    }
}
