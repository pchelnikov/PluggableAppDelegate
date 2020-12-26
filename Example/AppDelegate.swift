//
//  AppDelegate.swift
//  PluggableAppDelegateExample
//
//  Created by Mikhail Pchelnikov on 31/07/2018.
//  Copyright © 2018 Michael Pchelnikov. All rights reserved.
//

import UIKit

import PluggableAppDelegate

@UIApplicationMain
class AppDelegate: PluggableApplicationDelegate {

    override var services: [ApplicationService] {
        return [
            RootVCApplicationService(),
            LoggerApplicationService()
        ]
    }
}

extension AppDelegate {
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
