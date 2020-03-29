//
//  Coordinator.swift
//  Boosters
//
//  Created by Danil on 3/27/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import UIKit.UINavigationController

protocol Coordinator: AnyObject {
    
    var presentation: UINavigationController { get }
    var finish: ((Coordinator) -> Void)? { get set }

    func addChild(coordinator: Coordinator)
    func removeChild(coordinator: Coordinator)
    func onStart()
    func onBack(animated: Bool)
    func onError(error: Error?)
}
