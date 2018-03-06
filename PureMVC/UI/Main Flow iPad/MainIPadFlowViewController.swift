//
//  MainIPadFlowViewController.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 06/03/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class MainIPadFlowViewController: UIViewController {

    private var splitView: UISplitViewController!
    
    let session: Session
    init(_ session: Session) {
        self.session = session
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.splitView = UISplitViewController()

        let list = ViewControllersFactory.listViewController
        let navigationController = UINavigationController(rootViewController: list)
        let viewModel = ListViewModel()
        viewModel.shouldResetSelection = false
        viewModel.onSelectRow = { [weak self] indexPath in
            self?.runDetailsFlow(for: indexPath)
        }
        list.viewModel = viewModel
        list.loadViewIfNeeded()
        
        let detailsPlaceholder = UIViewController()
        detailsPlaceholder.view.backgroundColor = UIColor.white
        self.splitView.viewControllers = [navigationController, detailsPlaceholder]
        self.embed(self.splitView)
    }
    
    private func runDetailsFlow(for indexPath: IndexPath) {
        let detailsFlow = DetailsFlowViewController(with: indexPath, session: self.session)
        detailsFlow.navigationItem.leftItemsSupplementBackButton = true
        detailsFlow.navigationItem.leftBarButtonItem = self.splitView.displayModeButtonItem
        let navigationController = UINavigationController(rootViewController: detailsFlow)
//        navigationController.navigationBar.topItem?.leftBarButtonItem = self.splitView.displayModeButtonItem
        self.splitView?.showDetailViewController(navigationController, sender: nil)
    }
}
