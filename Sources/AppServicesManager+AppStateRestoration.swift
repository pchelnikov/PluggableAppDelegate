//
//  AppServicesManager+AppStateRestoration.swift
//  PluggableAppDelegate
//
//  Created by Mikhail Pchelnikov on 31/07/2018.
//  Copyright © 2018 Michael Pchelnikov. All rights reserved.
//

import UIKit

extension PluggableApplicationDelegate {

    @available(iOS 6.0, *)
    open func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        var result = false
        for service in _services {
            if service.application?(application, shouldSaveApplicationState: coder) ?? false {
                result = true
            }
        }
        return result
    }

    @available(iOS 6.0, *)
    open func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        var result = false
        for service in _services {
            if service.application?(application, shouldRestoreApplicationState: coder) ?? false {
                result = true
            }
        }
        return result
    }

    @available(iOS 6.0, *)
    open func application(_ application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? {
        for service in _services {
            if let viewController = service.application?(application, viewControllerWithRestorationIdentifierPath: identifierComponents, coder: coder) {
                return viewController
            }
        }

        return nil
    }

    @available(iOS 6.0, *)
    open func application(_ application: UIApplication, willEncodeRestorableStateWith coder: NSCoder) {
        for service in _services {
            service.application?(application, willEncodeRestorableStateWith: coder)
        }
    }

    @available(iOS 6.0, *)
    open func application(_ application: UIApplication, didDecodeRestorableStateWith coder: NSCoder) {
        for service in _services {
            service.application?(application, didDecodeRestorableStateWith: coder)
        }
    }
}
