//
//  DetailsViewModel.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 26/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    var onSettingsHandler: (() -> Void)?

    var title: String {
        return "Details #\(self.indexPath.row)"
    }
    
    let indexPath: IndexPath
    
    init(_ indexPath: IndexPath) {
        self.indexPath = indexPath
    }
}
