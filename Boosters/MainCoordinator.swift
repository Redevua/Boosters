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
        let controller = MainViewController(contentView: contentView)
        presentation.setViewControllers([controller], animated: true)
    }
}

