//
//  UIView+Embedding.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 26/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

extension UIView {

    func embed(_ childView: UIView) {
        childView.translatesAutoresizingMaskIntoConstraints = true
        childView.autoresizingMask = [.flexibleWidth, .flexibleHeight];
        childView.frame = self.bounds
        self.addSubview(childView)
    }
    
}
