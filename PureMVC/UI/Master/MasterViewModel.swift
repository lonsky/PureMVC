//
//  MasterViewModel.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 04/03/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class MasterViewModel: NSObject {

    var onShowSettings: (() -> Void)?
    
    var title: String {
        return "Master"
    }
}
