//
//  AppServicesManager+SiriKitHandling.swift
//  PluggableAppDelegate
//
//  Created by Mikhail Pchelnikov on 02/08/2018.
//  Copyright © 2018 Michael Pchelnikov. All rights reserved.
//

import UIKit
import Intents

extension PluggableApplicationDelegate {

    @available(iOS 11.0, *)
    open func application(_ application: UIApplication, handle intent: INIntent, completionHandler: @escaping (INIntentResponse) -> Void) {
        apply({ (service, completionHandler) -> Void? in
            service.application?(application, handle: intent, completionHandler: completionHandler)
        }, completionHandler: { results in
            let result = results.min(by: { $0.hashValue < $1.hashValue }) ?? INIntentResponse()
            completionHandler(result)
        })
    }
}
