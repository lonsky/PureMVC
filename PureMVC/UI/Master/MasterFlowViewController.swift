//
//  MasterFlowViewController.swift
//  PureMVC
//
//  Created by Alexander Lonsky on 04/03/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class MasterFlowViewController: UIViewController {

    private enum State {
        case list
        case loading
        case error
    }
    
    private var state: State = .loading {
        didSet {
            self.updateContent()
        }
    }
    
    private var masterViewController: MasterViewController!
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

        self.masterViewController = ViewControllersFactory.masterViewController
        let navigationController = UINavigationController(rootViewController: self.masterViewController)
        let viewModel = MasterViewModel()
        viewModel.onShowSettings = { [weak self] in
            self?.runSettingsFlow()
        }
        self.masterViewController.viewModel = viewModel
        self.embed(navigationController)
        
        self.state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.state = .list
        }
    }
    
    private func updateContent() {
        switch self.state {
        case .loading:
            self.showActivityView()
        case .list:
            self.showListView()
        case .error:
            self.showErrorView()
        }
    }
    
    private func showListView() {
        let list = ViewControllersFactory.listViewController
        let viewModel = ListViewModel()
        viewModel.onSelectRow = { [weak self] indexPath in
            self?.runDetailsFlow(for: indexPath)
        }
        list.viewModel = viewModel
        self.masterViewController.transition(to: list)
    }
    
    private func runSettingsFlow() {
        let settingsFlow = SettingsFlowViewController(with: .modal)
        settingsFlow.onDoneDidPress = { [weak self] in
            self?.dismiss(animated: true)
        }
        settingsFlow.onSignOutDidPress = { [weak self] in
            self?.session.state = .signedOut
            self?.dismiss(animated: true)
        }
        self.present(settingsFlow, animated: true)
    }
    
    private func showActivityView() {
        let activity = ViewControllersFactory.activityViewController
        self.masterViewController.transition(to: activity)
    }
    
    private func showErrorView() {
        // TODO:
    }
    
    private func runDetailsFlow(for indexPath: IndexPath) {
        let detailsFlow = DetailsFlowViewController(with: indexPath, session: self.session)
        self.masterViewController.navigationController?.pushViewController(detailsFlow, animated: true)
    }
}
