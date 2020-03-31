//
//  AppDelegate.swift
//  Boosters
//
//  Created by Danil on 3/27/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var root: AppRoot!
    var window: UIWindow?
       
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       root = AppRoot(
            application,
            didFinishLaunchingWithOptions: launchOptions,
            window: &window
        )
        return true
    }
}

