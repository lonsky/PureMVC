//
//  MasterTableViewModel.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 26/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import Foundation

class MasterTableViewModel {
    
    var onSelectRow: ((_ indexPath: IndexPath) -> Void)?
    var onShowSettings: (() -> Void)?
    
    var title: String {
        return "Master"
    }

    var numberOfRows: Int {
        return 10
    }
    
    func reuseIdentifier(for indexPath: IndexPath) -> String {
        return "cell"
    }
    
    func title(for indexPath: IndexPath) -> String {
        return "Item #\(indexPath.row)"
    }
}
