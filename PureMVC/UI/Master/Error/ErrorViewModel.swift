//
//  ErrorViewModel.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 04/03/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class ErrorViewModel: NSObject {

    var onRetryDidPress: (() -> Void)?
    
    var title: String {
        return "Error"
    }
    
    var details: String {
        return "Couldn't request data. Please try again"
    }
}
