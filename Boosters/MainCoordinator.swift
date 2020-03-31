//
//  MainCoordinator.swift
//  Boosters
//
//  Created by Danil on 3/27/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import UIKit

protocol MainCoordinatorProtocol {
    func onOpenUrl(atPath path: String?)
}

class MainCoordinator: BaseCoordinator {

    override func onStart() {
        let contentView = MainView()
        let viewModel = MainViewModel()
        let controller = MainViewController(contentView: contentView, viewModel: viewModel)
        presentation.setNavigationBarHidden(true, animated: false)
        presentation.setViewControllers([controller], animated: true)
    }
}

