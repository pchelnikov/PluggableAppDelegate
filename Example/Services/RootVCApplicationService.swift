//
//  RootVCApplicationService.swift
//  PluggableAppDelegate
//
//  Created by Mikhail Pchelnikov on 31/07/2018.
//  Copyright © 2018 Michael Pchelnikov. All rights reserved.
//

import Foundation

import PluggableAppDelegate

final class RootVCApplicationService: NSObject, ApplicationService {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()

        return true
    }
}
