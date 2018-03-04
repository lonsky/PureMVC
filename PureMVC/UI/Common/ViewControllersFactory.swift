//
//  ViewControllersFactory.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 26/02/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

enum PresentationMode {
    case details
    case modal
}

struct ViewControllersFactory {
    
    static let storyboard: UIStoryboard = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard
    }()
    
    static var masterViewController: MasterTableViewController {
       return self.storyboard.instantiateViewController(withIdentifier: "master") as! MasterTableViewController
    }
    
    static var detailsViewController: DetailsViewController {
        return self.storyboard.instantiateViewController(withIdentifier: "details") as! DetailsViewController
    }
    
    static var signInViewController: SignInViewController {
        return self.storyboard.instantiateViewController(withIdentifier: "signin") as! SignInViewController
    }
    
    static var settingsViewController: SettingsViewController {
        return self.storyboard.instantiateViewController(withIdentifier: "settings") as! SettingsViewController
    }
    
    static var activityViewController: UIViewController {
        return self.storyboard.instantiateViewController(withIdentifier: "activity")
    }
}
