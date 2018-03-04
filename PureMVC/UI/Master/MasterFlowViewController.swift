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
            self.updateUI()
        }
    }
    
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

        self.state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.state = .list
        }
    }
    
    private func updateUI() {
        switch self.state {
        case .loading:
            self.showActivityView()
        case .list:
            self.showMasterView()
        case .error:
            self.showErrorView()
        }
    }
    
    private func showMasterView() {
        let masterViewController = ViewControllersFactory.masterViewController
        let navigationController = UINavigationController(rootViewController: masterViewController)
        let viewModel = MasterTableViewModel()
        viewModel.onSelectRow = { [weak self] indexPath in
            self?.runDetailsFlow(for: indexPath, navigationController: navigationController)
        }
        viewModel.onShowSettings = { [weak self] in
            self?.runSettingsFlow()
        }
        masterViewController.viewModel = viewModel
        self.transition(to: navigationController)
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
        self.transition(to: activity)
    }
    
    private func showErrorView() {
        // TODO:
    }
    
    private func runDetailsFlow(for indexPath: IndexPath, navigationController: UINavigationController) {
        let detailsFlow = DetailsFlowViewController(with: indexPath, session: self.session)
        navigationController.pushViewController(detailsFlow, animated: true)
    }
}
