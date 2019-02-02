//
//  AppDelegate.swift
//  WatchDepartures
//
//  Created by Radim Langer on 02/02/2019.
//  Copyright © 2019 Radim Langer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

