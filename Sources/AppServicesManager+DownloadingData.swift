//
//  AppServicesManager+DownloadingData.swift
//  PluggableAppDelegate
//
//  Created by Mikhail Pchelnikov on 31/07/2018.
//  Copyright © 2018 Michael Pchelnikov. All rights reserved.
//

import UIKit

extension PluggableApplicationDelegate {

    /// Applications with the "fetch" background mode may be given opportunities to fetch updated content in the background or when it is convenient for the system. This method will be called in these situations. You should call the fetchCompletionHandler as soon as you're finished performing that operation, so the system can accurately estimate its power and data cost.
    @available(iOS 7.0, *)
    open func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        apply({ (service, completionHandler) -> Void? in
            service.application?(application, performFetchWithCompletionHandler: completionHandler)
        }, completionHandler: { results in
            let result = results.min(by: { $0.rawValue < $1.rawValue }) ?? .noData
            completionHandler(result)
        })
    }

    // Applications using an NSURLSession with a background configuration may be launched or resumed in the background in order to handle the
    // completion of tasks in that session, or to handle authentication. This method will be called with the identifier of the session needing
    // attention. Once a session has been created from a configuration object with that identifier, the session's delegate will begin receiving
    // callbacks. If such a session has already been created (if the app is being resumed, for instance), then the delegate will start receiving
    // callbacks without any action by the application. You should call the completionHandler as soon as you're finished handling the callbacks.
    @available(iOS 7.0, *)
    open func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        apply({ (service, completionHandler) -> Void? in
            service.application?(
                application,
                handleEventsForBackgroundURLSession: identifier,
                completionHandler: {
                    completionHandler(())
            })
        }, completionHandler: { _ in
            completionHandler()
        })
    }
}
