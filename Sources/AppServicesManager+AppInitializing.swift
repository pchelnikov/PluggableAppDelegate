//
//  AppServicesManager+AppInitializing.swift
//  PluggableAppDelegate
//
//  Created by Mikhail Pchelnikov on 31/07/2018.
//  Copyright © 2018 Michael Pchelnikov. All rights reserved.
//

import UIKit

extension PluggableApplicationDelegate {

    @available(iOS 6.0, *)
    open func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        var result = false
        for service in _services {
            if service.application?(application, willFinishLaunchingWithOptions: launchOptions) ?? false {
                result = true
            }
        }
        return result
    }

    @available(iOS 3.0, *)
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        var result = false
        for service in _services {
            if service.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? false {
                result = true
            }
        }
        return result
    }

    @available(iOS 2.0, *)
    open func applicationDidFinishLaunching(_ application: UIApplication) {
        _services.forEach { $0.applicationDidFinishLaunching?(application) }
    }
}
