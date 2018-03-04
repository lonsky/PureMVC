//
//  UIViewController+Embedding.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 26/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

extension UIViewController {

    func embed(_ childViewController: UIViewController) {
        self.embed(childViewController, into: self.view)
    }

    func embed(_ childViewController: UIViewController, into containerView: UIView) {
        self.addChildViewController(childViewController)
        containerView.embed(childViewController.view)
        childViewController.didMove(toParentViewController: self)
    }
    
    func removeFromParent() {
        guard self.parent != nil else {
            return
        }
        
        self.willMove(toParentViewController: nil)
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
    
    func transition(to child: UIViewController, with duration: Double = 0.3, completion: ((Bool) -> Void)? = nil) {

        let current = self.childViewControllers.last
        
        self.addChildViewController(child)
        
        if let existing = current {
            
            existing.willMove(toParentViewController: nil)
            self.transition(from: existing, to: child, duration: duration, options: [.transitionCrossDissolve], animations: { }) { done in
                existing.removeFromParentViewController()
                child.didMove(toParentViewController: self)
                completion?(done)
            }
            
        } else {
            self.view.embed(child.view)
            
            UIView.animate(withDuration: duration, delay: 0, options: [.transitionCrossDissolve], animations: { }) { done in
                child.didMove(toParentViewController: self)
                completion?(done)
            }
        }
    }
}
