//
//  LoggerApplicationService.swift
//  PluggableAppDelegate
//
//  Created by Mikhail Pchelnikov on 31/07/2018.
//  Copyright © 2018 Michael Pchelnikov. All rights reserved.
//

import Foundation

import PluggableAppDelegate

final class LoggerApplicationService: NSObject, ApplicationService {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("🎉 LoggerApplicationService has started!")
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("🙀 LoggerApplicationService has entered background")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("😻 LoggerApplicationService has entered foreground")
    }
}
